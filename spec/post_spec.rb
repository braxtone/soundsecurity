require_relative 'spec_helper'

describe "Posts" do
  before(:each) do
    @posts = []

    Dir.foreach('_posts') do |p|
      @posts << IO.read("_posts/#{p}") if p.match(/^[^.]\w/)
    end
  end

  it "should have valid yaml" do
    @posts.each do |post|
      begin
        YAML.load(post)
      rescue Psych::SyntaxError => e
        pp e
        pp post
        raise "Post syntax is not valid"
      end
    end
  end

  describe "with show notes" do
    before(:each) do
      @posts = []
      @audio_files = []

      Dir.foreach('_posts') do |p|
        @posts << IO.read("_posts/#{p}") if p.match(/^[^.]\w/)
      end
      @posts = @posts.map { |p| YAML.load(p) }
      # Filter the non-episode related posts
      @posts.select! { |p| p['category'] == 'episodes' }

      Dir.foreach('audio') do |p|
          @audio_files << p if p.match(/^sound-security-e\d{3}\.mp3$/)
      end
    end

    it "should have correct podcasting metadata fields" do
      @posts.each do |post|
        required_fields = %w(date episode title duration length category audio_file_path subtitle articles breach)
        expect(post.keys).to include(*required_fields)
      end
    end

    it "should have a valid date field" do
      require 'date'
      @posts.each do |post|
        expect(post['date'].to_s).not_to eq("2016-NN-NN")
        expect(Date.strptime(post['date'].to_s, '%Y-%m-%d')).to be_a(Date)
      end
    end

    it "should have a valid duration field" do
      # https://help.apple.com/itc/podcasts_connect/#/itcb54353390
      # Regex: http://rubular.com/r/PI9aMMVYNW
      @posts.each do |post|
        expect(post['duration']).to match(/^([0-2][0-9]:[0-5][0-9]:[0-5][0-9])$|^([0-9]:[0-5][0-9]:[0-5][0-9])$|^(((:?[0-5])[0-9]):((:?[0-5])[0-9]))$|^([0-9]:[0-5][0-9])$/)
      end
    end

    it "should have a valid length field" do
      # https://help.apple.com/itc/podcasts_connect/#/itcb54353390
      @posts.each do |post|
        expect(post['length'].to_s).to match(/^[0-9]{1,}$/)
      end
    end

    it "should have a valid episode field" do
      # https://help.apple.com/itc/podcasts_connect/#/itcb54353390
      @posts.each do |post|
        expect(post['episode'].to_s).to match(/^[0-9]{1,}$/)
      end
    end

    it "should have a valid subtitle field" do
      @posts.each do |post|
        expect(post['subtitle'].to_s).not_to eq("")
        expect(post['subtitle'].length).to be <= 140
      end
    end

    it "should have a corresponding audio file in audio directory" do
      @posts.each do |post|
        expect(@audio_files).to include(post['audio_file_path'].split("/")[2])
      end
    end
  end
end
