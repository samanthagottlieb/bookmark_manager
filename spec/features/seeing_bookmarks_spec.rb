feature 'See bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    Bookmark.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.add(url: 'http://www.google.com', title: 'Google')
    Bookmark.add(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')

    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
