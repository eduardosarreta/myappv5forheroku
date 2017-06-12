class CreateSenators < ActiveRecord::Migration[5.0]
  def change
    create_table :senators do |t|
      t.string :name
      t.string :party
      t.string :sex
      t.string :state
      t.string :telephone
      t.string :email
      t.string :picture
      t.string :expenses

      t.timestamps

    end
  end
end
