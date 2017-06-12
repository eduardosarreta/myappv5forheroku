class CreateBookmarkedSenators < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarked_senators do |t|
      t.integer :user_id
      t.integer :senator_id

      t.timestamps

    end
  end
end
