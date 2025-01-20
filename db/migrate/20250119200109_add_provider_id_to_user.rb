class AddProviderIdToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :provider_id, :integer
  end
end
