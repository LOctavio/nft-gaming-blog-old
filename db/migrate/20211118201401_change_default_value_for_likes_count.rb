class ChangeDefaultValueForLikesCount < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:posts, :likes_counter, 0)
  end
end
