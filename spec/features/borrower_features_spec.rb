require 'rails_helper'
feature 'Borrower features ' do
  before do
    # calling factory girl create method
    @borrower = create(:borrower)
    log_in
  end
  feature "borrower dashboard" do
    before do
        visit "/borrowers/#{@borrower.id}"
    end
    scenario "displays borrower information" do
      expect(page).to have_text("Welcome, #{@borrower.first_name} #{@borrower.last_name}!")
    end
  end
end
