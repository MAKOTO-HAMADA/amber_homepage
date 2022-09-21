require "test_helper"

class Public::ItemGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_item_genres_show_url
    assert_response :success
  end
end
