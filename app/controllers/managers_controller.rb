class ManagersController < ApplicationController

  def new
  end

  def create
    manager = Manager.new(manager_params)
    if manager.save
      session[:manager_id] = manager.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

  def manager_params
    params.require(:manager).permit(:name, :last, :company, :email, :password, :password_confirmation)
  end
end
