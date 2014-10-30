require 'bundler'
Bundler.require(:default)

Dir.glob('./{helpers,models,controllers}/*.rb').each do |file|
	require file
	puts "required #{file}"
end

map('/'){run ApplicationController}
map('/entry'){run EntryController}
map('/sessions'){run SessionsController}
# map('/tag'){run TagController}