class CreateCommentsExpenseDeputies < ActiveRecord::Migration[5.0]
  def change
    create_table :comments_expense_deputies do |t|
      t.integer :user_id
      t.string :body
      t.integer :red_flag_expense_deputy_id
      t.integer :deputy_id

      t.timestamps

    end
  end
end
