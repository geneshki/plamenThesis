class AddSaltToRegistration < ActiveRecord::Migration
  def change
    add_column :registrations, :salt, :string
  end
end
