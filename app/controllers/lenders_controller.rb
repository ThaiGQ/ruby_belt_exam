class LendersController < ApplicationController
    def create
        lender = Lender.create(lender_params)
        puts "*************************************"
        puts lender.errors.messages
        if lender.errors.messages.any?
            flash[:notice] = lender.errors.full_messages
            redirect_to "/sessions/register"
        else
            flash[:notice] = ["New Lender successfully registered! Please login with your email and password!"]
            redirect_to "/sessions/login"
        end
    end

    def index
        @current_user = Lender.find(session[:user_id])
        @current_capital = @current_user.capital - @current_user.loans.sum(:amount_loaned)
        @borrowers = Borrower.all
        @loans = Loan.where(lender_id: session[:user_id])
    end

    private
        def lender_params
            params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :capital)
        end
end
