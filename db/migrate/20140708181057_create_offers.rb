class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.float :price
      t.string :shop
      t.string :url

      t.timestamps
    end
  end
end
