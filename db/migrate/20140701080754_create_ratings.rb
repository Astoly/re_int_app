class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :reading_id
      t.integer :score01, default: 0      
      t.integer :score02, default: 0
      t.integer :score03, default: 0
      t.integer :score04, default: 0
      t.integer :score05, default: 0

      t.timestamps
    end
  end
end
