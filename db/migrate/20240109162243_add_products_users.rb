class AddProductsUsers < ActiveRecord::Migration[7.1]
    def change
      create_table :products_users, id: false do |t|
        t.belongs_to :user
        t.belongs_to :product
      end
    end
  end