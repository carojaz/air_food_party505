class AddStateRemoveValidateToRental < ActiveRecord::Migration[6.0]
  def change
    remove_column :rentals, :validate
    add_column :rentals, :state, :string, default: "pending"
  end
end
