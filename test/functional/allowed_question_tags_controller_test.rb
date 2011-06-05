require 'test_helper'

class AllowedQuestionTagsControllerTest < ActionController::TestCase
  setup do
    @allowed_question_tag = allowed_question_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allowed_question_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allowed_question_tag" do
    assert_difference('AllowedQuestionTag.count') do
      post :create, :allowed_question_tag => @allowed_question_tag.attributes
    end

    assert_redirected_to allowed_question_tag_path(assigns(:allowed_question_tag))
  end

  test "should show allowed_question_tag" do
    get :show, :id => @allowed_question_tag.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @allowed_question_tag.to_param
    assert_response :success
  end

  test "should update allowed_question_tag" do
    put :update, :id => @allowed_question_tag.to_param, :allowed_question_tag => @allowed_question_tag.attributes
    assert_redirected_to allowed_question_tag_path(assigns(:allowed_question_tag))
  end

  test "should destroy allowed_question_tag" do
    assert_difference('AllowedQuestionTag.count', -1) do
      delete :destroy, :id => @allowed_question_tag.to_param
    end

    assert_redirected_to allowed_question_tags_path
  end
end
