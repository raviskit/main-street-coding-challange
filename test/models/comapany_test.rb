require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  test "valid email" do
    company = Company.new(name: "test company", email: "test@getmainstreet.com", zip_code: 93003)
    assert_equal company.valid?, true
  end

  test "invalid email" do
    company = Company.new(name: "test company", email: "test@test.com", zip_code: 93003)
    assert_equal company.valid?, false
    assert_includes company.errors.full_messages, "Email should only be a @getmainstreet.com domain"
  end
end