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
        required_fields = %w(date title duration length category audio_file_path)
        expect(post.keys).to include(*required_fields)
      end
    end

    it "should have a valid date field" do
      @posts.each do |post|
        expect(post['date'].to_s).not_to eq("1969-07-16")
        expect(post['date'].to_s).to match(/^20\d{2}-\d{2}-\d{2}/)
      end
    end

    it "should have a valid duration field" do
      # http://www.apple.com/itunes/podcasts/specs.html#duration
      # http://rubular.com/r/PI9aMMVYNW
      @posts.each do |post|
        expect(post['duration']).to match(/^([0-2][0-9]:[0-5][0-9]:[0-5][0-9])$|^([0-9]:[0-5][0-9]:[0-5][0-9])$|^(((:?[0-5])[0-9]):((:?[0-5])[0-9]))$|^([0-9]:[0-5][0-9])$/)
      end
    end

    it "should have a valid length field" do
      # http://www.apple.com/itunes/podcasts/specs.html
      @posts.each do |post|
        expect(post['length'].to_s).to match(/[0-9]{1,}/)
      end
    end

    it "should have a valid audio file in audio directory" do
      @posts.each do |post|
        expect(@audio_files).to include(post['audio_file_path'].split("/")[2])
      end
    end
  end
end
