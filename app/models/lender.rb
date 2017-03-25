class Lender < ActiveRecord::Base
    has_secure_password
    has_many :loans, dependent: :destroy
    has_many :borrowers, :through => :loans, :source => "borrower"

    PASSWORD_REGEX = /\A(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]{8,})\z/i # contains at least 1 number and 8 character minimum
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates_numericality_of :capital, presence: true, minimum: { greater_than_or_equal_to: 1000 }

    before_save :downcase_email
    before_create validates :password, format: { with: PASSWORD_REGEX }

    private
        def downcase_email
            self.email.downcase!
        end

        def valid_password
            validate :password, format: { with: PASSWORD_REGEX }
        end
  end
