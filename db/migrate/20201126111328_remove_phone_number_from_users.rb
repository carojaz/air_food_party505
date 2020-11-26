class RemovePhoneNumberFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :phone_number, :integer
  end
end
