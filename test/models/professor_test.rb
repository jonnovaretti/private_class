require 'test_helper'

class ProfessorTest < ActiveSupport::TestCase
  test 'should save professor with password' do
    password = 'pass123'
    professor = Professor.new(name: 'professor name', email: 'professor@email.com', password: password)

    assert professor.save
  end

  test 'should be different password and password_digest' do
    password = 'pass123'
    professor = Professor.create(name: 'professor name', email: 'professor@email.com', password: password)

    assert professor.password_digest != password
  end

  test 'should be impossible to save email taken' do
    same_email = 'same@email.com'

    Professor.create(name: 'professor name', email: same_email, password: 'pass234')
    professor2 = Professor.new(name: 'professor name', email: same_email, password: 'pass222')

    assert_not professor2.save
  end
end
