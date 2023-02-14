class ChangeWatchToStar < ActiveRecord::Migration[7.0]
  def change
    rename_column :repos, :last_watch_cursor, :last_star_cursor
  end
end
