class AddCheckToWords < ActiveRecord::Migration
  def change
    add_column :words, :check, :string
  end
end
