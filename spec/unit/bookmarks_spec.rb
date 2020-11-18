require 'pg'

describe Bookmark do
  describe '#all' do
    it 'returns all bookmarks' do
        con = PG.connect :dbname => 'bookmark_manager_test', :user => 'Samantha'
        con.exec "INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com'), ('http://www.google.com'), ('http://www.destroyallsoftware.com');"

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end
end
