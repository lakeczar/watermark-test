require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "should not save message without title" do
    message = Message.new(video: "some_video.mp4")
    assert_not message.save, "Saved the message without a title"
  end

  test "should not save message without video" do
    message = Message.new(title: "Sample Title")
    assert_not message.save, "Saved the message without a video"
  end

  # test "should save message when both title and video are present" do
  #   message = Message.new(title: "Sample Title",  video: "some_video.mp4")
  #   assert message.save, "Failed to save the message with a title and video"
  # end
end
