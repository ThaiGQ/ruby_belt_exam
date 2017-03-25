require 'rails_helper'

RSpec.describe Borrower, type: :model do
    context "with invalid attributes should not save if" do
        it 'password does not contain at least 1 number and 8 minimum characters' do
            expect(build(:borrower, password: 'password')).to be_invalid
        end
    end
end
