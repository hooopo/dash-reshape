class CreateStars < ActiveRecord::Migration[7.0]
  def change
    create_table :stars, id: false do |t|
      t.bigint :repo_id 
      t.bigint :user_id
      # avatar_url -> https://avatars.githubusercontent.com/u/19?size=50
      
      t.string :login 
      t.string :location 
      t.string :company
      
      t.datetime :starred_at
      t.timestamps

      t.index [:repo_id, :user_id], unique: true
    end
  end
end