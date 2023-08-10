class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @my_users = User.all
  end

  def show
    @my_user = User.find(params[:id])
  end

  private
    def user_params
      params.fetch(:user, {:name})
    end
end
