class ManagersController < ApplicationController

  before_action :authorize, only: [:profile]

  def new
  end

  def create
    manager = Manager.new(manager_params)
    if manager.save
      ManagerMailer.welcome_email(manager).deliver
      session[:manager_id] = manager.id
      redirect_to '/profile'
    else
      #TODO: include an error flash message if someone is unable to properly create a manager
      redirect_to '/signup'
    end
  end

  def profile
    @manager = current_manager
    #TODO: When chaining methods try it like this:
    @projects = Project
      .where({manager_id: current_manager})
      .order(:updated_at)
      .reverse_order
  end


private

  def manager_params
    params.require(:manager).permit(:name, :last, :company, :email, :password, :password_confirmation, :image)
  end

end
