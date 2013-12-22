class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :description
      t.integer :position
      t.attachment :image

      t.timestamps
    end
  end
end
