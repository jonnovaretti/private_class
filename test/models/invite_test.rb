require 'test_helper'
require 'securerandom'

class InviteTest < ActiveSupport::TestCase
  setup do
    @professor = Professor.create(name: 'Professor name', email: 'email@email.com', password: 'pass123')
  end

  test 'should save invite' do
    invite = Invite.new(student_email: 'student@email.com', professor: @professor, identifier: SecureRandom.uuid)

    assert invite.save
  end

  test 'should update verified column' do
    invite = Invite.create(student_email: 'student@email.com', professor: @professor, identifier: SecureRandom.uuid)

    invite.verify

    assert invite.save
  end

  test 'should be valid when the valid_until is greater or equal than today' do
    invite = Invite.create(student_email: 'student@email.com', professor: @professor, identifier: SecureRandom.uuid)

    assert invite.still_valid?
  end
end
