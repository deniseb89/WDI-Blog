class EntryController < ApplicationController

	get '/new' do
		authenticate!
		erb :new
	end

	post '/new' do
		blog = Blog.create(params[:blog])
		redirect '/'
	end

	get '/:id/edit' do
		@post = Blog.find(params[:id])
		erb :edit
	end

	patch '/:id' do
		authenticate!
		post = Blog.find(params[:id])
		post.update(params[:post])
		redirect "/entry/#{post.id}"
	end

	get '/:id' do
		authenticate!
		@post = Blog.find(params[:id])
		erb :show
	end

	delete '/:id' do
		authenticate!
		Blog.destroy(params[:id])
		redirect '/'
	end
end