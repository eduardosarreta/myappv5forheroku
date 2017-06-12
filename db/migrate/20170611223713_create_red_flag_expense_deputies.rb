class CreateRedFlagExpenseDeputies < ActiveRecord::Migration[5.0]
  def change
    create_table :red_flag_expense_deputies do |t|
      t.integer :user_id
      t.integer :deputy_id
      t.string :expense_description
      t.string :expense_detail
      t.float :expense_amount

      t.timestamps

    end
  end
end
