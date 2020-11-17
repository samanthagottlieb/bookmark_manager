feature 'See bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    visit('/')
    click_button('bookmarks')

    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
    expect(page).to have_content('http://www.neopets.com')
    expect(page).to have_content('https://youtu.be/rI5cu3G5oXk')
  end
end
