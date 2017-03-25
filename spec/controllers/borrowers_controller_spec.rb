require 'rails_helper'

RSpec.describe BorrowersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get 'borrowers/:borrower_id'
      expect(response).to have_http_status(:success)
    end
  end

end
