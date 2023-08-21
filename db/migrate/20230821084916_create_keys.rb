class CreateKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :keys do |t|
      t.string :code
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
