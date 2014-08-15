require 'bundler'
Bundler.require

require 'minitest/autorun'

require_relative '../models/link'

describe Link do
  describe 'given an empty link' do
    before do
      @link = Link.new
    end

    it 'has the correct url' do
      @link.url.must_be_nil
    end

    it 'has the correct slug' do
      @link.slug.length.must_equal 8
    end

    it 'has the correct count' do
      @link.count.must_equal 0
    end

    it 'has the correct created_at' do
      @link.created_at.must_be_nil
    end
  end

  describe 'given a full link' do
    before do
      @link = Link.new(url: 'https://www.codefellows.org/')
    end

    it 'has the correct url' do
      @link.url.must_equal 'https://www.codefellows.org/'
    end

    it 'has the correct slug' do
      @link.slug.length.must_equal 8
    end

    it 'has the correct count' do
      @link.count.must_equal 0
    end

    it 'has the correct created_at' do
      @link.created_at.must_be_nil
    end
  end
end
