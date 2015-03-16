#!/bin/bash
BUCKET=$1
TMP_DIR=`mktemp -d -t gzsync`
 
# Get a list of comma-delimited excluded filetypes
OIFS=$IFS;
IFS=",";
EXCLUDED_FILETYPES=($2)
IFS=$OIFS;

# check that we have a trailing slash
[[ $BUCKET != */ ]] && BUCKET="$BUCKET"/
 
printf "Copying files to temporary directory... "
cp -R . $TMP_DIR && cd $TMP_DIR
printf "Done\n"
 
PWD=`pwd`
if [ "$PWD" = "$TMP_DIR" ]
then
    for filename in $(find . -type f | sed "s/\.\///g" | grep -v git | grep -v .DS_Store)
    do
        printf "${filename}..."

        # Skip compression for files that we're told to exclude
        extension="${filename##*.}"

        # Yeah, this is a horrible way to check if an array contains a string
        # but it works so... ship it!
        excluded=$(echo ${EXCLUDED_FILETYPES[@]} | grep -o "$extension" -c )

        if [ $excluded -ne 0 ]
        then 
          printf "not compressing...uploading..."
          s3cmd put ${filename} ${BUCKET}${filename} --acl-public > /dev/null 2>&1
        else
          printf "compressing..."
          gzip -t ${filename} > /dev/null 2>&1 || { gzip -9 ${filename}; mv ${filename}.gz ${filename}; } 
          printf "uploading..."
          s3cmd put ${filename} ${BUCKET}${filename} \
            --add-header "Content-Encoding: gzip" \
            --add-header "Cache-Control: max-age = 604800" \
            --acl-public > /dev/null 2>&1
        fi

        printf "done\n"
    done
 
    printf "Cleaning up... "
    cd && rm -rf ${TMP_DIR}
    printf "Done\n"
else
    echo "ERROR: Failed to change to current directory, exiting" 1>&2
fi
