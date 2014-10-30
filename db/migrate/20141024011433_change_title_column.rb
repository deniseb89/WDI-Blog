class ChangeTitleColumn < ActiveRecord::Migration
  def change
  	change_column :blogs, :title, :text
  end
end
