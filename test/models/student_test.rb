require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test 'should save student' do
    student = Student.new(name: 'Student name', email: 'email@email.com', password: 'pass123')

    assert student.save
  end

  test 'should not save student having invalid email' do
    student = Student.new(name: 'Student name', email: 'email', password: 'pass123')

    assert_not student.save
  end

  test 'should password and password_digest be difference' do
    student = Student.create(name: 'Student name', email: 'email@email.com', password: 'pass123')

    assert student.password != student.password_digest
  end
end
