feature 'Add bookmark' do
  scenario 'a user can submit a new bookmark via a form' do
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'Samantha'
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')"
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.google.com')"
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"

    visit('/')
    click_button('bookmarks')
    click_button('add')
    fill_in('url', with: 'https://airtable.com')
    click_button('Submit')
    expect(page).to have_content('https://airtable.com')
  end
end
