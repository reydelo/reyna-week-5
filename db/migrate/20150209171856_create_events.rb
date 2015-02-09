class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.integer :date
      t.boolean :requires_id
    end
  end
end
