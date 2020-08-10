class Company < ApplicationRecord
  VALID_EMAIL_REGREX = /\A[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(getmainstreet)\.com\z/

  validates :email, format: { with: VALID_EMAIL_REGREX, message: "should only be a @getmainstreet.com domain" },
            allow_blank: true, uniqueness: true

  has_rich_text :description


end
