class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :file_name
      t.integer :item_id

      t.timestamps
    end
  end
end
