class AddRegionOnStars < ActiveRecord::Migration[7.0]
  def change
    add_column :stars, :region, :string
  end
end