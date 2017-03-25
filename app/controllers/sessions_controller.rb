class SessionsController < ApplicationController
    def create
        if lender = Lender.find_by_email(params[:email])
            if lender.authenticate(params[:password])
                session[:user_id] = lender.id
                session[:user] = lender
                redirect_to "/lenders/#{lender.id}"
            else
                flash[:notice] = ["Invalid Combination"]
                redirect_to "/sessions/register"
            end
        elsif borrower = Borrower.find_by_email(params[:email])
            if borrower.authenticate(params[:password])
                session[:user_id] = borrower.id
                session[:user] = borrower
                redirect_to "/borrowers/#{borrower.id}"
            else
                flash[:notice] = ["Invalid Combination"]
                redirect_to "/sessions/register"
            end
        else
            flash[:notice] = ["Invalid Combination"]
            redirect_to "/sessions/register"
        end
    end

    def destroy
        reset_session
        redirect_to "/sessions/register"
    end

    def login
    end

    def new
    end

    def register
    end
end
