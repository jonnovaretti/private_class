require 'securerandom'

class StudentInvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor = Professor.create(name: 'professor test name', email: 'email@professor.com', password: 'pass12345')
    @invite = Invite.create(student_email: 'student2@gmail.com', professor: @professor, identifier: SecureRandom.uuid)
    @invite2 = Invite.create(student_email: 'student@gmail.com', professor: @professor, identifier: SecureRandom.uuid)
  end

  test 'should get index' do
    get student_url(identifier: @invite.identifier)
    assert :success
  end

  test 'should create new student' do
    assert_difference('Student.count') do
      post student_invites_url, params: { student: { email: 'student2@gmail.com',
                                                     name: 'Student name',
                                                     password: 'pass123',
                                                     professor: @professor } }
    end

    assert :success
  end

  test 'should not create new student if password and password confirmation are differents' do
    assert_difference('Student.count', 0) do
      post student_invites_url, params: { student: { email: 'student@gmail.com',
                                                     name: 'Student name',
                                                     password: 'pass123',
                                                     password_confirmation: '123pass' } }
    end

    assert_select 'li', "Password confirmation doesn't match Password"
    assert student_url(identifier: @invite2.identifier)
  end
end
