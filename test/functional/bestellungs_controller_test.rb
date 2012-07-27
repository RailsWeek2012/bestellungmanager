require 'test_helper'

class BestellungsControllerTest < ActionController::TestCase
  setup do
    @bestellung = auftrags(:one)
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
      post :create, bestellung: { [: @bestellung.[, ]: @bestellung.], comment: @bestellung.comment, name: @bestellung.name, preis: @bestellung.preis, speise: @bestellung.speise }
    end

    assert_redirected_to auftrag_path(assigns(:bestellung))
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
    put :update, id: @bestellung, bestellung: { [: @bestellung.[, ]: @bestellung.], comment: @bestellung.comment, name: @bestellung.name, preis: @bestellung.preis, speise: @bestellung.speise }
    assert_redirected_to auftrag_path(assigns(:bestellung))
  end

  test "should destroy bestellung" do
    assert_difference('Bestellung.count', -1) do
      delete :destroy, id: @bestellung
    end

    assert_redirected_to auftrags_path
  end
end
