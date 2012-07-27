require 'test_helper'

class GruppesControllerTest < ActionController::TestCase
  setup do
    @gruppe = bestellungs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gruppes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gruppe" do
    assert_difference('Gruppe.count') do
      post :create, gruppe: { ,: @gruppe.,, ,: @gruppe.,, [: @gruppe.[, details: @gruppe.details, termin: @gruppe.termin, title: @gruppe.title }
    end

    assert_redirected_to bestellung_path(assigns(:gruppe))
  end

  test "should show gruppe" do
    get :show, id: @gruppe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gruppe
    assert_response :success
  end

  test "should update gruppe" do
    put :update, id: @gruppe, gruppe: { ,: @gruppe.,, ,: @gruppe.,, [: @gruppe.[, details: @gruppe.details, termin: @gruppe.termin, title: @gruppe.title }
    assert_redirected_to bestellung_path(assigns(:gruppe))
  end

  test "should destroy gruppe" do
    assert_difference('Gruppe.count', -1) do
      delete :destroy, id: @gruppe
    end

    assert_redirected_to bestellungs_path
  end
end
