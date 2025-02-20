class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :description
      t.string :video
      t.string :thumbnail

      t.timestamps
    end
  end
end
