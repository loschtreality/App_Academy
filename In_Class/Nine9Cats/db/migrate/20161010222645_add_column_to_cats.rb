class AddColumnToCats < ActiveRecord::Migration
  def change
    add_column :cats, :dextarity, :integer
  end
end
