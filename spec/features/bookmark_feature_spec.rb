feature 'index page' do
  scenario 'can run app and check index page content' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'viewing bookmarks' do
  scenario 'user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    #add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1,'https://medium.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2,'https://www.google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3,'https://twitter.com');")

    visit('/bookmarks')

    expect(page).to have_content "https://medium.com"
    expect(page).to have_content "https://www.google.com"
    expect(page).to have_content "https://twitter.com"
  end
end
