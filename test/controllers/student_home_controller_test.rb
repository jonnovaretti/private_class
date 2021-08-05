require 'test_helper'

class StudentHomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    professor = Professor.create(name: 'Professor name', email: 'professor@gmail.com', password: 'pass123')
    @student = Student.create(name: 'Student name again',
                              email: 'again@emal.com',
                              password: 'pass123',
                              professor: professor)
  end

  test 'should get index home' do
    post student_signin_url, params: { session: { email: @student.email,
                                                  password: @student.password } }

    get student_home_path
    assert_select 'h5', @student.professor.name
    assert :success
  end
end
