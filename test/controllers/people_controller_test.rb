require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      process :create, method: :post, params: { person: { date_of_birth: @person.date_of_birth,
                              email: 'email@email.com',
                              first_name: @person.first_name,
                              height_feet: @person.height_feet,
                              height_inches: @person.height_inches,
                              last_name: @person.last_name,
                              phone: @person.phone,
                              ssn: '555-555-5555',
                              weight: @person.weight } }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    process :show, method: :get, params: { id: @person }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { id: @person }
    assert_response :success
  end

  test "should update person" do
    process :update, mehod: :patch, params: { id: @person, person: { date_of_birth: @person.date_of_birth,
                                          email: @person.email,
                                          first_name: @person.first_name,
                                          height_feet: @person.height_feet,
                                          height_inches: @person.height_inches,
                                          last_name: @person.last_name,
                                          phone: @person.phone,
                                          ssn: @person.ssn,
                                          weight: @person.weight }}

    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      process :destroy, method: :delete, params: { id: @person }
    end

    assert_redirected_to people_path
  end
end
