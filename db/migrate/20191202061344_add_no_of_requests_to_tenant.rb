class AddNoOfRequestsToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :no_of_request, :int, :default => 0
  end
end
