feature 'index page' do
  scenario 'can run app and check index page content' do
    visit('/')
    expect(page).to have_content "hello world"
  end
end
