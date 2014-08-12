class AddContentToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :content, :text
  end
end
