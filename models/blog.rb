# require 'csv'
class Blog <ActiveRecord::Base

	# attr_accessor :pagesource, :title, :post, :created_at

	# def initialize(options={})
	# 	@title = options["title"] || ""
	# 	@post = options["post"] || ""
	# 	@created_at = options["created_at"]
	# end

	# def save(file)
	# 	@pagesource = file
	# 	CSV.open(@pagesource, 'a') do |csv|
	# 		csv << [title, post, created_at]
	# 	end
	# end

	# def to_s
	# 	"Title: #{@title}\nTime: #{@created_at}\nPost: #{@post}"
	# end
end