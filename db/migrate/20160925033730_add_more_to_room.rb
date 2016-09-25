class AddMoreToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :size, :string
    add_column :rooms, :location, :string
  end
end
