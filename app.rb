require 'sinatra'

class BookmarkManager < Sinatra::Base

  get '/' do
    'Bookmark Manager hello'
  end
end
