class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.references :survey, null: false, foreign_key: true
      t.string :component_type
      t.text :content
      t.integer :position_x
      t.integer :position_y

      t.timestamps
    end
  end
end
