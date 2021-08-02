require 'test_helper'

class ProfessorSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor = Professor.create(name: 'professor test name', email: 'email@any.com', password: 'pass12345')
  end

  test 'should get index' do
    get professor_signin_url
    assert_response :success
  end

  test 'should authenticate professor' do
    post professor_signin_url, params: { session: { email: 'email@any.com',
                                                    password: 'pass12345' } }

    assert session[:professor_id]
    assert_response 302, status
  end

  test 'should notify when email is invalid' do
    post professor_signin_url, params: { session: { email: 'email_not_found@any.com',
                                                    password: 'pass12345' } }

    assert_not session[:professor_id]
    assert_select 'p', 'Email or password invalid'
  end

  test 'should notify when password is invalid' do
    post professor_signin_url, params: { session: { email: 'email@any.com',
                                                    password: 'invalid_pass' } }
    assert_not session[:professor_id]
    assert_select 'p', 'Email or password invalid'
  end

  test 'should destroy session when logout is requested' do
    delete professor_logout_url

    assert_not session[:professor_id]
  end
end
