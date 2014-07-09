class AddIndexToOffersShopId < ActiveRecord::Migration
  def change
    add_belongs_to :offers, :shop, index: true
    rename_column :offers, :shop, :shop_name
    Offer.find_each do |offer|
      shop = Shop.find_or_create_by!(name: offer.shop_name)
      offer.shop = shop
      offer.save!
    end
    remove_column :offers, :shop_name
  end
end
