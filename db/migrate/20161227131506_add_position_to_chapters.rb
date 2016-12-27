class AddPositionToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :position, :integer, index: true
    add_index :chapters, :position
  end
end
