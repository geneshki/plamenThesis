class AddAuthorToWords < ActiveRecord::Migration
  def change
    add_column :words, :author, :string
  end
end
