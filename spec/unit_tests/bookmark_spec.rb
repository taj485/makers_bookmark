require 'bookmark'

describe '#all' do

  it 'can display a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager')
    # add bookmarks to the test database
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://medium.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://twitter.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include("https://medium.com")
    expect(bookmarks).to include("https://www.google.com")
    expect(bookmarks).to include("https://twitter.com")
  end
end
