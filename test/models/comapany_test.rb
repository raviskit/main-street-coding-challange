require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "valid email" do
    company = Company.new(name: "test company", email: "test@getmainstreet.com", zip_code: 99583)
    assert_equal company.valid?, true
  end

  test "invalid email" do
    company = Company.new(name: "test company", email: "test@test.com", zip_code: 99583)
    assert_equal company.valid?, false
    assert_includes company.errors.full_messages, "Email should only be a @getmainstreet.com domain"
  end

  test "presence of zipcode" do
    company = Company.new(name: "test company", email: "test@test.com")
    assert_equal company.valid?, false
  end

  test "invalid zipcode" do
    company = Company.new(name: "test company", email: "test@test.com", zip_code: "100009911")
    assert_equal company.valid?, false
    assert_includes company.errors.full_messages, "Zip code is invalid"
  end

  test "updates state and city before save" do
    company = companies(:hometown_painting)
    company.save
    assert_equal company.city, "Ventura"
    assert_equal company.state, "CA"
  end
end