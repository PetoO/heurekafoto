class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :url
      t.integer :rating
      t.integer :reviews
    end
  end
end
