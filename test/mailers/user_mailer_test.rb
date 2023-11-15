require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'confirmations' do
    mail = UserMailer.confirmations
    assert_equal 'Confirmations', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
