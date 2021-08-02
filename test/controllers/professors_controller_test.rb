require 'test_helper'

class ProfessorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor = Professor.create(name: 'professor test name', email: 'email@professor.com', password: 'pass12345')
  end

  test 'should get index' do
    get professors_url
    assert_response :success
  end

  test 'should get new' do
    get new_professor_url
    assert_response :success
  end

  test 'should create professor' do
    assert_difference('Professor.count') do
      post professors_url, params: { professor: { email: 'email@any.com',
                                                  name: 'professor name',
                                                  password: 'pass2233',
                                                  password_confirmation: 'pass2233' } }
    end

    assert_redirected_to professor_url(Professor.last)
  end

  test "should not create professor when password and password confirmation don't match" do
    post professors_url, params: { professor: { email: 'email@any.com',
                                                name: 'professor name',
                                                password: 'pass2233',
                                                password_confirmation: 'pass1234' } }
    byebug
    assert_equal 422, status
  end

  test 'should show professor' do
    get professor_url(@professor)
    assert_response :success
  end

  test 'should get edit' do
    get edit_professor_url(@professor)
    assert_response :success
  end

  test 'should update professor' do
    patch professor_url(@professor), params: { professor: { email: @professor.email,
                                                            name: @professor.name,
                                                            password: @professor.password } }
    assert_redirected_to professor_url(@professor)
  end

  test 'should destroy professor' do
    assert_difference('Professor.count', -1) do
      delete professor_url(@professor)
    end

    assert_redirected_to professors_url
  end
end
