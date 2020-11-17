describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.neopets.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end
end
