require 'pg'

def setup_test_database
  con = PG.connect :dbname => 'bookmark_manager_test', :user => 'Samantha'
  con.exec "TRUNCATE TABLE bookmarks CASCADE;"
end
