class AddDownvotesToWord < ActiveRecord::Migration
  def change
    add_column :words, :downvotes, :integer
  end
end
