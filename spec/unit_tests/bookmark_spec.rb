require 'bookmark'

describe Bookmark do

  describe '#all' do

    it 'can display a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager')
      Bookmark.create(url: "https://medium.com")
      Bookmark.create(url: "https://google.com")
      Bookmark.create(url: "https://twitter.com")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://medium.com")
      expect(bookmarks).to include("https://google.com")
      expect(bookmarks).to include("https://twitter.com")
    end
  end

  describe '#create' do
    it 'can add new bookmarks to the list' do
      create_bookmark = Bookmark.create("https://youtube.com")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://youtube.com")
    end
  end
end
