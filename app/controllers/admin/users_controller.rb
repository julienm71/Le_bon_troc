class Admin::UsersController < ApplicationController
before_action :authenticate_admin!

  def index
    @current_nav = "Users"
    @users = User.all.uniq
    @users_classic = User.where(admin: false).uniq
    @users_admin = User.where(admin: true).uniq
  end

  # def modal_settings
  #   current_user = User.find(params[:format])
  #   @current_modal_user = current_user

  #   @status_list = ["en attente", "refusé", "accepté"]
  #   @annonces =  Annonce.all.order(created_at: :desc)
  #   @annonces_user = []
  #   @annonces.each do |annonce|
  #     if annonce.user_id == current_user.id
  #       @annonces_user << annonce
  #     end
  #   end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @annonce = User.find(params[:id])
    @annonce.destroy
    redirect_to admin_users_path
  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end

  # def users_params
  #   params.permit(:format, :user)
  # end
end
