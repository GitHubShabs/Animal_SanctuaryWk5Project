require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/controller.rb')

get "/" do
  erb(:index)
end

get '/about' do
  erb(:about)
end
