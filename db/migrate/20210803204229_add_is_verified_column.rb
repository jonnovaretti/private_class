class AddIsVerifiedColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :is_verified, :boolean
    add_column :invites, :verified_at, :datetime
  end
end
