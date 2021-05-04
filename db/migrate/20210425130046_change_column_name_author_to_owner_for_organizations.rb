class ChangeColumnNameAuthorToOwnerForOrganizations < ActiveRecord::Migration[6.1]
  def change
    remove_column :organizations, :author_id

    add_reference :organizations, :owner, foreign_key: { to_table: :users }
  end
end
