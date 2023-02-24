class AddRestaurantIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :restaurant_id, :integer
  end
end
