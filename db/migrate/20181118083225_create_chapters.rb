class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.text :content
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
