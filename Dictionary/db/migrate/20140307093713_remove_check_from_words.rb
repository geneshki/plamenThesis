class RemoveCheckFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :check, :string
  end
end
