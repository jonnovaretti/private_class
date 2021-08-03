class ProfessorInvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor = Professor.create(name: 'professor test name', email: 'email@any.com', password: 'pass12345')
  end

  test 'should get index' do
    get professor_invites_url
    assert_response :success
  end

  test 'should send email and create invite' do
    post professor_signin_url, params: { session: { email: 'email@any.com', password: 'pass12345' } }

    assert_difference('Invite.count') do
      post professor_invites_url, params: { invite: { student_email: 'student@gmail.com' } }
    end

    assert_redirected_to professor_students_path
  end

  test 'should show up notice when invite is invalid' do
    post professor_signin_url, params: { session: { email: 'email@any.com', password: 'pass12345' } }

    post professor_invites_url, params: { invite: { student_email: 'student@@gmail.com' } }

    assert_select 'li', 'Student email is invalid'
  end
end
