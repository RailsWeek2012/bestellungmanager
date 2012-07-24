require 'test_helper'

class BestellungsControllerTest < ActionController::TestCase
  setup do
    @bestellung = bestellungs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bestellungs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bestellung" do
    assert_difference('Bestellung.count') do
      post :create, bestellung: { ,: @bestellung.,, ,: @bestellung.,, [: @bestellung.[, details: @bestellung.details, termin: @bestellung.termin, title: @bestellung.title }
    end

    assert_redirected_to bestellung_path(assigns(:bestellung))
  end

  test "should show bestellung" do
    get :show, id: @bestellung
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bestellung
    assert_response :success
  end

  test "should update bestellung" do
    put :update, id: @bestellung, bestellung: { ,: @bestellung.,, ,: @bestellung.,, [: @bestellung.[, details: @bestellung.details, termin: @bestellung.termin, title: @bestellung.title }
    assert_redirected_to bestellung_path(assigns(:bestellung))
  end

  test "should destroy bestellung" do
    assert_difference('Bestellung.count', -1) do
      delete :destroy, id: @bestellung
    end

    assert_redirected_to bestellungs_path
  end
end
