class CreateWordVoteds < ActiveRecord::Migration
  def change
    create_table :word_voteds do |t|
      t.integer :word_id
      t.integer :user_id
      t.integer :vote_val

      t.timestamps
    end
  end
end
