class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def show
         @user = User.find(params[:id])
         @rejections = @user.rejections
         render json: {user: @user, rejections: @rejections}
    end

    

    private
    def user_params
        params.require(:user).permit(:f_name,:l_name,:username,:email,:password,:cohort_name)
    end
end
