class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    
    if @user != nil

      if BCrypt::Password.new(@user["password"]) == params["password"] 

        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome"
        redirect_to "/"
      else
        redirect_to "/login"
        flash["notice"] = "Email or password combination incorrect."
      end
    
    end

  end

  def destroy
    session["user_id"] = nil

    flash["notice"] = "Bye Bye."
    redirect_to "/login"
  end
end
  