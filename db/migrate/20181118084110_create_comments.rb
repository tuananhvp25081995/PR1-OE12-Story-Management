class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :story, foreign_key: true
      t.text :content
      t.text :parent_comment

      t.timestamps
    end
  end
end
