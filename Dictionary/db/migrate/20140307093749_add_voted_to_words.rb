class AddVotedToWords < ActiveRecord::Migration
  def change
    add_column :words, :voted, :string
  end
end
