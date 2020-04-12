class AddIndexAccountsProviderUidIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :accounts, [:provider, :uid], unique: true
  end
end
