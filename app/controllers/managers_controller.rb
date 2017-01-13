class ManagersController < ApplicationController

  before_action :authorize, only: [:profile]

  def new
  end

  def create
    manager = Manager.new(manager_params)
    if manager.save
      session[:manager_id] = manager.id
      redirect_to '/profile'
    else
      redirect_to '/signup'
    end
  end

  def profile
    @manager = current_manager
    @projects = Project.where({manager_id: current_manager}).order(:updated_at).reverse_order
  end

private

  def manager_params
    params.require(:manager).permit(:name, :last, :company, :email, :password, :password_confirmation)
  end
end
