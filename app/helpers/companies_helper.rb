module CompaniesHelper
  def verify_zipcode
    return "" unless @company.zip_code.present?
    "#{@company.city}, #{@company.state}"
  end
end