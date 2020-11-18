feature 'See bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'Samantha'
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')"
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.google.com')"
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"

    visit('/')
    click_button('bookmarks')

    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
