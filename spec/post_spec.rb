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
      Dir.foreach('_posts') do |p|
        @posts << IO.read("_posts/#{p}") if p.match(/^[^.]\w/)
      end

      @posts = @posts.map { |p| YAML.load(p) }

      @posts.select! { |p| p['category'] == 'episodes' }
    end

    it "should have correct podcasting metadata fields" do
      @posts.each do |post|
        required_fields = %w(date title duration length category)
        expect(post.keys).to include(*required_fields)
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
  end
end
