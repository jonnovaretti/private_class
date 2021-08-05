class AddRelationshipStudentProfessor < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :professor_id, :integer
    add_foreign_key :students, :professors
  end
end
