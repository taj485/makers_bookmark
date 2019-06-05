# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'can display a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager')
      Bookmark.create('https://medium.com', 'MEDIUM')
      Bookmark.create('https://google.com', 'GOOGLE')
      Bookmark.create('https://twitter.com', 'TWITTER')

      bookmarks = Bookmark.all

      expect(bookmarks).to include('https://medium.com')
      expect(bookmarks).to include('https://google.com')
      expect(bookmarks).to include('https://twitter.com')
    end
  end

  describe '#create' do
    it 'can add new bookmarks to the list' do
      create_bookmark = Bookmark.create('https://youtube.com', 'YOUTUBE')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('YOUTUBE')
      expect(bookmarks).to include('https://youtube.com')
    end
  end
end
