class CreateNewsStores < ActiveRecord::Migration[6.0]
  def change
    create_table :news_stores do |t|
      t.string :title,     null: false
      t.text   :description
      t.string :url,       null: false
      t.string :category,  null: false
      t.timestamps
    end
  end
end
