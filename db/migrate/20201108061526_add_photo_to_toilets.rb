class AddPhotoToToilets < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :photo, :string
  end
end
