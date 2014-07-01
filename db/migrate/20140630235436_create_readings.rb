class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.text :content
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
