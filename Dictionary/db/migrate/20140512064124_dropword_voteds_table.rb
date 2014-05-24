class DropwordVotedsTable < ActiveRecord::Migration
  def change

    drop_table :word_voteds
  end
end
