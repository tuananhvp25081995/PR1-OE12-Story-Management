class CreateTableMember < ActiveRecord::Migration[5.1]
  def change
    create_table :table_members do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :admin
    end
  end
end
