require 'pg'

class Bookmark
  def self.all
    con = PG.connect :dbname => 'bookmark_manager', :user => 'Samantha'

    result = con.exec 'SELECT * FROM bookmarks'
    result.map { |key, value| key['url'] }
  end
end
