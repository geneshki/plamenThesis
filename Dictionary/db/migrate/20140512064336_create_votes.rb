class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :word_id
      t.integer :vote_value

      t.timestamps
    end
  end
end
