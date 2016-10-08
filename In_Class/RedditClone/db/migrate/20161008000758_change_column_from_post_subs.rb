class ChangeColumnFromPostSubs < ActiveRecord::Migration
  def change
    rename_column :post_subs, :subs_id, :sub_id
  end
end
