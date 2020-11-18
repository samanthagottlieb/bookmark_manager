require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'Samantha'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'Samantha'
    end

    result = con.exec 'SELECT * FROM bookmarks'
    result.map { |key, value| key['url'] }
  end
end
