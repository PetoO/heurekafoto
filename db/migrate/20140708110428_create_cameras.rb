class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
