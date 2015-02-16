class SessionsController < ApplicationController
  def new
  end

  def create
    word = params[:session][:last_name]
    user = User.find_by(last_name: word)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash[:danger] = "#{word} not found"
      render 'new'
    end
  end

  def destroy
    log_out
    render 'new'
  end
end
