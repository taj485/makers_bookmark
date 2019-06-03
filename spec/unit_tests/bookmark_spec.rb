require 'bookmark'

describe '#all' do

  it 'can display a list of bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("https://medium.com")
    expect(bookmarks).to include("https://google.com")
  end
end
