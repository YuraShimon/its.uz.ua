class CreateUserparams < ActiveRecord::Migration[5.1]
  def change
    create_table :userparams do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :country
      t.string :city
      t.integer :age

      t.timestamps
    end
  end
end
