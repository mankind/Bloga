require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "post_created" do
    mail = PostMailer.post_created
    assert_equal "Post created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
