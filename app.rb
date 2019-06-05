require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
attr_reader :add_bookmark
  get '/' do
    "Bookmark Manager"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/add' do
  Bookmark.create(params[:url])
  puts "hello"
  redirect('/bookmarks')
  end


  run! if app_file == $0
end
