class AddWriteAccessToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :write_access, :integer
  end
end
