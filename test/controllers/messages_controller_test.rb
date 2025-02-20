require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    get new_message_url
    assert_response :success
  end

  # test "should create message" do
  #   assert_difference("Message.count") do
  #     post messages_url, params: { message: { title: "Test Title", description: "Test Description", video: "test_video.mp4", thumbnail: "test_thumbnail.jpg" } }
  #   end
  #   assert_redirected_to root_path
  #   assert_equal "Message uploaded successfully!", flash[:notice]
  # end

  test "should not create message without title" do
    assert_no_difference("Message.count") do
      post messages_url, params: { message: { title: "", description: "Test Description", video: "test_video.mp4", thumbnail: "test_thumbnail.jpg" } }
    end
    assert_response :unprocessable_entity
  end

  test "should not create message without video" do
    assert_no_difference("Message.count") do
      post messages_url, params: { message: { title: "Test Title", description: "Test Description", video: "", thumbnail: "test_thumbnail.jpg" } }
    end
    assert_response :unprocessable_entity
  end

  # test "should get edit" do
  #   message = messages(:one)
  #   get edit_message_url(message)
  #   assert_response :success
  # end

  # test "should update message" do
  #   message = messages(:one)
  #   patch message_url(message), params: { message: { title: "Updated Title", description: "Updated Description" } }
  #   assert_redirected_to root_path
  #   assert_equal "Record updated successfully!", flash[:notice]
  # end

  test "should not update message with invalid data" do
    message = messages(:one)
    patch message_url(message), params: { message: { title: "", description: "Updated Description" } }
    assert_response :unprocessable_entity
  end

  test "should destroy message" do
    message = messages(:one)
    assert_difference("Message.count", -1) do
      delete message_url(message)
    end
    assert_redirected_to messages_path
    assert_equal "Message deleted successfully!", flash[:notice]
  end
end
