require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(:dbname => 'bookmark_manager_test', :user => 'Samantha')
    else
      con = PG.connect(:dbname => 'bookmark_manager', :user => 'Samantha')
    end

    result = con.exec('SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.add(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(:dbname => 'bookmark_manager_test')
    else
      con = PG.connect(:dbname => 'bookmark_manager')
    end

    result = con.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, url, title")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(:dbname => 'bookmark_manager_test')
    else
      con = PG.connect(:dbname => 'bookmark_manager')
    end

    con.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end
