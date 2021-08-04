class StudentSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = Student.create(name: 'Student name', email: 'student@email.com', password: 'pass123')
  end

  test 'should get index' do
    get student_signin_url
    assert :success
  end

  test 'should student be able to sign in' do
    post student_signin_url, params: { session: { email: 'student@email.com',
                                                  password: 'pass123' } }

    assert session[:student_id]
    assert_response 302, status
  end

  test 'should notify when email is invalid' do
    post student_signin_url, params: { session: { email: 'email_not_found@any.com',
                                                  password: 'pass12345' } }

    assert_not session[:student_id]
    assert_select 'p', 'Email or password invalid'
  end

  test 'should notify when password is invalid' do
    post student_signin_url, params: { session: { email: 'email@any.com',
                                                  password: 'invalid_pass' } }
    assert_not session[:student_id]
    assert_select 'p', 'Email or password invalid'
  end

  test 'should destroy session when logout is requested' do
    delete student_logout_url

    assert_not session[:student_id]
  end
end
