class Loan < ActiveRecord::Base
    belongs_to :lender
    belongs_to :borrower

    validates :lender, :borrower, presence: true
end
