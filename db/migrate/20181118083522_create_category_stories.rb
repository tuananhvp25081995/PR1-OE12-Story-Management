class CreateCategoryStories < ActiveRecord::Migration[5.1]
  def change
    create_table :category_stories do |t|
      t.references :story, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
