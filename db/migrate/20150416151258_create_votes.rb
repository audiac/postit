class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.string :voteable_type
      t.integer :voteable_id
      t.timestamps
    end
  end
end
