feature 'See bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    Bookmark.add('http://www.makersacademy.com')
    Bookmark.add('http://www.google.com')
    Bookmark.add('http://www.destroyallsoftware.com')

    visit('/')
    click_button('bookmarks')

    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end
