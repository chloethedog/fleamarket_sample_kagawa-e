class UsersController < ApplicationController
  before_action :authenticate_user!

  def favorite
    @favorites = Favorite.where(user_id: current_user.id)

  end
end