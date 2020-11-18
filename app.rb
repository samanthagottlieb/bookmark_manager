require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base

  get('/') do
    erb(:index)
  end

  get('/bookmarks') do
    @bookmarks = Bookmark.all
    erb(:'bookmarks')
  end

  get('/bookmarks/add') do
    erb(:'bookmarks/add')
  end

  post('/bookmarks/added') do
    Bookmark.add(params['url'])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
