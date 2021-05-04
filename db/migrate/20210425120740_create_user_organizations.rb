class CreateUserOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :user_organizations do |t|
      t.string :role, default: 'member'

      t.references :user
      t.references :organization

      t.timestamps
    end
  end
end
