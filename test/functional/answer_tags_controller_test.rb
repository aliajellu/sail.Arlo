require 'test_helper'

class AnswerTagsControllerTest < ActionController::TestCase
  setup do
    @answer_tag = answer_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:answer_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create answer_tag" do
    assert_difference('AnswerTag.count') do
      post :create, :answer_tag => @answer_tag.attributes
    end

    assert_redirected_to answer_tag_path(assigns(:answer_tag))
  end

  test "should show answer_tag" do
    get :show, :id => @answer_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @answer_tag.to_param
    assert_response :success
  end

  test "should update answer_tag" do
    put :update, :id => @answer_tag.to_param, :answer_tag => @answer_tag.attributes
    assert_redirected_to answer_tag_path(assigns(:answer_tag))
  end

  test "should destroy answer_tag" do
    assert_difference('AnswerTag.count', -1) do
      delete :destroy, :id => @answer_tag.to_param
    end

    assert_redirected_to answer_tags_path
  end
end
