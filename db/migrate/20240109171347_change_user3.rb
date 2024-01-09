class ChangeUser3 < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :writing
    change_table :users do |t|
      t.string role
    end
  end
end
