module Users
  class ProfilesController < ::ApplicationController
    def show
      user = User.find_by(id: params[:id])
      if user
        render json: { status: 200, proile: user.profile, username: user.name }
      else
        render json: { status: 500 }
      end
    end

    def edit
    end
  end
end
