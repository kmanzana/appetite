class AddImageUrlToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :image_url, :string, default: 'http://www.restaurantratings.com/assets/restaurant-icon-283a3eceacfd466c9081cc365869b986.gif'
  end
end
