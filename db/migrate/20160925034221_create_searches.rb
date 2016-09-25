class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :size
      t.string :location

      t.timestamps
    end
  end
end
