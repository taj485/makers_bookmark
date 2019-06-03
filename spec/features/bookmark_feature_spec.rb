feature 'index page' do
  scenario 'can run app and check index page content' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Bookmarks' do
  scenario 'can view all bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "https://medium.com/"
    expect(page).to have_content "https://www.google.com/"
    expect(page).to have_content "https://twitter.com/"
  end
end
