class RemoveUselessColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :pull_requests, :commits_count 
    remove_column :pull_requests, :reviews_count
  end
end
