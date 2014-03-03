class AddFactorToWords < ActiveRecord::Migration
  def change
    add_column :words, :factor, :real
  end
end
