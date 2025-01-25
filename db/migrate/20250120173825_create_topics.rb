class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.string :uid
      t.integer :state, default: 0
      t.references :language, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
