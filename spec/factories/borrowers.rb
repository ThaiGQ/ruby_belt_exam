FactoryGirl.define do
  factory :borrower do
    first_name "MyString"
    last_name "MyString"
    email "MyString@email.com"
    password "password1"
    loan_name "MyString"
    loan_detail "MyText"
    capital_needed 1000
    capital_raised 0
  end
end
