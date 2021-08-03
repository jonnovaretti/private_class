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
end
