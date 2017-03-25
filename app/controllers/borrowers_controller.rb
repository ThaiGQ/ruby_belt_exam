class BorrowersController < ApplicationController
    before_action :authorize, except: [:new, :create]
    # before_action :confirm_user, except: [:new, :create]

    def create
        borrower = Borrower.create(borrower_params)
        puts "*************************************"
        puts borrower.errors.messages
        if borrower.errors.messages.any?
            flash[:notice] = borrower.errors.full_messages
            redirect_to "/sessions/register"
        else
            flash[:notice] = ["New Borrower successfully registered! Please login with your email and password!"]
            redirect_to "/sessions/login"
        end
    end

    def index
        @current_user = Borrower.find(session[:user_id])
        @loans = Loan.where(borrower: session[:user_id])
    end

    def update

    end

    private
        def borrower_params
            params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :loan_name, :loan_detail, :capital_needed).merge(capital_raised: 0)
        end

        # def confirm_user
        #     borrower = Borrower.find(session[:user_id])
        #     if session[:user].first_name != borrower.first_name && session[:user].last_name != borrower.last_name
        #         redirect_to "/users/#{session[:user_id]}"
        #     end
        # end
end
