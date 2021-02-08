class ChangeColumnRoleFromIntegerToStringForUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :role, :string, default: 'user'

    add_index :users, :role
  end
end
