class ChangeDefaultValueForCommentsCount < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:posts, :comments_counter, 0)
  end
end
