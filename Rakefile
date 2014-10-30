require 'bundler'
Bundler.require
require 'sinatra/activerecord/rake'

require_relative 'connection'
require_relative 'models/blog'

namespace :db do
	require 'pg'
	desc "Create blog_db database"
	task :create_db do
		conn = PG::Connection.open()
		conn.exec('CREATE DATABASE blog_db;')
		conn.close
	end

	desc "Drop blog_db database"
	task :drop_db do
		conn = PG::Connection.open()
		conn.exec('DROP DATABASE blog_db;')
		conn.close
	end

	desc "seed database with sample posts"
	task :load_data do
		require 'csv'
		conn = PG::Connection.open({dbname: 'blog_db'})
		CSV.foreach('blog.csv') do |row|
			title = row[0]
			post = row[1]
			created_at = row[2]
			sql_statement = <<-eos
INSERT INTO blogs
	(title, post, created_at)
VALUES
	($1, $2, $3)
			eos
			conn.exec_params(sql_statement, [title, post, created_at])
		end
		conn.close
	end
end

