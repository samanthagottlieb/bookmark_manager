feature 'Add bookmark' do
  scenario 'a user can submit a new bookmark via a form' do
    con = PG.connect :dbname => 'bookmark_manager_test', :user => 'Samantha'
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com')"
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.google.com')"
    con.exec "INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com')"

    visit('/bookmarks/add')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')

    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
