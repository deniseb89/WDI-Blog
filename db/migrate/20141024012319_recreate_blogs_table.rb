class RecreateBlogsTable < ActiveRecord::Migration
  def change
  	create_table :blogs do |t|
  		t.text :title
  		t.text :post

  		t.timestamps
  	end
  end
end
