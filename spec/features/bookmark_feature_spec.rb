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
    connection.exec("INSERT INTO bookmarks VALUES(2,'https://google.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3,'https://twitter.com');")

    visit('/bookmarks')

    expect(page).to have_content "https://medium.com"
    expect(page).to have_content "https://google.com"
    expect(page).to have_content "https://twitter.com"
  end
end

feature 'adding bookmarks' do
  scenario 'user can add bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks')
    fill_in 'url', with: "https://youtube.com"
    click_button 'submit'
    expect(page).to have_content "https://youtube.com"
  end
end
