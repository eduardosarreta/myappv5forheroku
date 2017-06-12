class CreateBookmarkedDeputies < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarked_deputies do |t|
      t.integer :user_id
      t.integer :deputy_id

      t.timestamps

    end
  end
end
