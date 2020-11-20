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

  post('/bookmarks') do
    Bookmark.add(url: params['url'], title: params[:title])
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
