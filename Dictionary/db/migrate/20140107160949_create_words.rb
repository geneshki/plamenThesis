class CreateWords < ActiveRecord::Migration
  def change
  
    create_table :words do |t|
      t.string :word
      t.text :description
      t.string :language
      t.string :author
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
