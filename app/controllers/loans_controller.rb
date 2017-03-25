class LoansController < ApplicationController
    def create
        if params[:current_capital].to_i - params[:amount_loaned].to_i >= 0
            loan = Loan.new
            loan.amount_loaned = params[:amount_loaned].to_i
            loan.lender = Lender.find(session[:user_id])
            loan.borrower = Borrower.find(params[:borrower_id])
            loan.save
            redirect_to "/lenders/#{session[:user_id]}"
        else
            flash[:notice] = ["You can't loan out more than the capital you have left!"]
            redirect_to "/lenders/#{session[:user_id]}"
        end
    end

    def update
        if params[:current_capital].to_i - params[:amount_loaned].to_i >= 0
            loan = Loan.find(params[:loan_id])
            loan.amount_loaned += params[:amount_loaned].to_i
            loan.save
            redirect_to "/lenders/#{session[:user_id]}"
        else
            flash[:notice] = ["You can't loan out more than the capital you have left!"]
            redirect_to "/lenders/#{session[:user_id]}"
        end
    end

    private
        def loan_params
            params.require(:loan).permit(:amount_loaned).merge(borrower: Borrower.find(params[:borrower_id].to_i), lender: Lender.find(session[:user_id]))
        end
end
