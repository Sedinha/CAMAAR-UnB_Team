class SessionsController < ApplicationController
  def destroy
    session[:user_type] = nil
    session[:user_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso !"
  end
end
