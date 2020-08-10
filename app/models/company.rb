class Company < ApplicationRecord
  VALID_EMAIL_REGREX = /\A[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(getmainstreet)\.com\z/

  validates :email, format: { with: VALID_EMAIL_REGREX, message: "should only be a @getmainstreet.com domain" },
            allow_blank: true, uniqueness: true
  validates :zip_code, presence: true
  validate :valid_zip_code

  before_save :update_state_and_city

  has_rich_text :description

  def valid_zip_code
    if ZipCodes.identify(zip_code).nil?
      errors[:zip_code] << "is invalid"
      false
    else
      true
    end
  end

  def update_state_and_city
    zipcode_data = ZipCodes.identify(zip_code)
    self.city = zipcode_data[:city]
    self.state = zipcode_data[:state_code]
  end

end
