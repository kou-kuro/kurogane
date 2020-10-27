class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
