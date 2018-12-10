class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.text :describe
      t.string :image
      t.references :author, foreign_key: true
      t.references :member, foreign_key: true
      
      t.timestamps
    end
  end
end
