class AddAddressToToilets < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :address, :string
  end
end
