class CreateCommentsExpenseSenators < ActiveRecord::Migration[5.0]
  def change
    create_table :comments_expense_senators do |t|
      t.integer :user_id
      t.string :body
      t.integer :red_flag_expense_senator_id
      t.integer :senator_id

      t.timestamps

    end
  end
end
