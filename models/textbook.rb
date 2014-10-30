require 'csv'
class Textbook
	attr_reader :pagesource

	def initialize(file)
		@pagesource = file
		@pages = []
	end
	def insert(page)
		CSV.open(@pagesource, 'a') do |csv|
			csv << [page.header, page.article, page.timestamp]
		end
	end
	def last_entry
		row = CSV.read(@pagesource).last
		header, article, timestamp = row
		str = "Header: #{header}\n"
		str << "Time: #{timestamp}\n"
		str << "Article: #{article}"
	end
	def to_s
		str = ""
		CSV.read(@pagesource).each do |row|
			header, article, timestamp = row
			str << "Header: #{header}\n"
			str << "Time: #{timestamp}\n"
			str << "Article: #{article}\n"
		end
		str.chomp
	end
end