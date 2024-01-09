class ChangeUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :second_name
    change_table :users do |t|
      t.string :last_name,              null: false, default: ""
    end
  end
end
