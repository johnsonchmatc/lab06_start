require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def setup
    @valid_person = Person.new(first_name: 'Bart',
                               last_name: 'Simpson',
                               height_feet: '5',
                               height_inches: '11',
                               weight: '220',
                               ssn: '123-45-6789',
                               date_of_birth: '01-01-1970',
                               email: 'bart@simpsons.com',
                               phone: '555-867-5309')
  end

  test "should be valid" do
    assert @valid_person.valid?
  end

  test "first name needs to be present" do
    @valid_person.first_name = nil
    assert_equal @valid_person.valid?, false
  end

  test "last name needs to be present" do
    @valid_person.last_name = nil
    assert_equal @valid_person.valid?, false
  end
  
  test "first name needs to be at least 1 character long" do
    @valid_person.first_name = "J"
    assert_equal @valid_person.valid?, true 
  end

  test "last name needs to be at least 1 character long" do
    @valid_person.last_name = "B"
    assert_equal @valid_person.valid?, true 
  end

  test "height_feet can not be string" do
    @valid_person.height_feet = "a"
    assert_equal @valid_person.valid?, false
  end

  test "height_feet can be a number" do
    @valid_person.height_feet = 5
    assert_equal @valid_person.valid?, true
  end

  test "height_feet can not be greater than 11 feet" do
    @valid_person.height_feet = 12
    assert_equal @valid_person.valid?, false 
  end

  test "height_feet can not be less than 0 feet" do
    @valid_person.height_feet = -1
    assert_equal @valid_person.valid?, false
  end

  test "height_inches can not be a string" do
    @valid_person.height_inches = "a"
    assert_equal @valid_person.valid?, false
  end

  test "height_inches can be a number" do
    @valid_person.height_inches = 5
    assert_equal @valid_person.valid?, true
  end

  test "height_inches can be a nil" do
    @valid_person.height_inches = nil
    assert_equal @valid_person.valid?, true
  end

  test "height_inches can not be greater than 11 inches" do
    @valid_person.height_inches = 12
    assert_equal @valid_person.valid?, false 
  end

  test "height_feet can not be less than 1 inch" do
    @valid_person.height_inches = 0
    assert_equal @valid_person.valid?, false
  end


  test "email should be unique" do
    email = 'bart@simpsons.com'
    @valid_person.email = email
    @valid_person.save

    second_valid_person = Person.new(first_name: 'Bart',
                               last_name: 'Simpson',
                               height_feet: '5',
                               height_inches: '11',
                               weight: '220',
                               ssn: '123-45-6789',
                               date_of_birth: '01-01-1970',
                               email: email,
                               phone: '555-867-5309')
    assert_equal second_valid_person.valid?, false
  end
  
end
