require 'bundler'
Bundler.require
require_relative 'connection'
enable :sessions

ROOT = Dir.pwd
Dir[ROOT+"/models/*.rb"].each { |file| require file }
# shows all posts
get '/' do
	@blogs = Blog.all
	erb :index
end
# returns a form to create a new post
get '/new' do
	if session[:current_user]
		erb :new
	else
		redirect '/'
	end
end
# create a new post
post '/new' do
	blog = Blog.create(params[:blog])
	redirect '/'
end
# returns a form to edit a post
get '/entry/:id/edit' do
	@post = Blog.find(params[:id])
	erb :edit
end
# updates an existing post
patch '/entry/:id' do
	if session[:current_user]
		post = Blog.find(params[:id])
		post.update(params[:food])
		erb :edit
	else
		redirect '/sessions/login'
	end
end
# display a single post
get '/entry/:id' do
	if session[:current_user]
		@post = Blog.find(params[:id])
		erb :show
	else
		redirect '/sessions/login'
	end
end

# destroy a post
delete '/entry/:id' do
	if session[:current_user]
		Blog.destroy(params[:id])
		redirect '/'
	else
		redirect '/sessions/login'
	end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.save!
  redirect '/'
end

get '/sessions/login' do
	erb :'sessions/login'
end

post '/sessions/login' do
	user = User.find_by({username: params[:username]})
	if user.password == params[:password]
		session[:current_user] = user.id
		redirect '/new'
	else
		redirect '/'
	end
end


delete '/sessions' do
	session[:current_user] = nil
	redirect '/'
end

