class ChangePosts < ActiveRecord::Migration
  def change
    change_column :posts, :sub_id, :integer, null: false
    change_column :posts, :author_id, :integer, null: false
  end
end
