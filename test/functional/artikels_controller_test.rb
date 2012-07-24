require 'test_helper'

class ArtikelsControllerTest < ActionController::TestCase
  setup do
    @artikel = artikels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artikels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artikel" do
    assert_difference('Artikel.count') do
      post :create, artikel: { comment: @artikel.comment, title: @artikel.title }
    end

    assert_redirected_to artikel_path(assigns(:artikel))
  end

  test "should show artikel" do
    get :show, id: @artikel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artikel
    assert_response :success
  end

  test "should update artikel" do
    put :update, id: @artikel, artikel: { comment: @artikel.comment, title: @artikel.title }
    assert_redirected_to artikel_path(assigns(:artikel))
  end

  test "should destroy artikel" do
    assert_difference('Artikel.count', -1) do
      delete :destroy, id: @artikel
    end

    assert_redirected_to artikels_path
  end
end
