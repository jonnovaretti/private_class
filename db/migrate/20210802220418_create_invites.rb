class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.string :student_email
      t.string :identifier
      t.date :valid_until
      t.belongs_to :professor

      t.timestamps
    end
  end
end
