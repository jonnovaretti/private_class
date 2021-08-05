require 'test_helper'

class ProfessorStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor = Professor.create(name: 'Professor name', email: 'prof@email.com', password: 'password123')
    @professor.students << Student.create(name: 'Student 1', email: 'stud@gmail.com', password: 'pass123')
    @professor.students << Student.create(name: 'Student 2', email: 'stud2@gmail.com', password: 'pass123')
  end

  test 'should get students index' do
    post professor_signin_url, params: { session: { email: @professor.email, password: @professor.password } }

    get professor_students_path
    assert :success
  end
end
