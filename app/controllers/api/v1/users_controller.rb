class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def profile
       @user=User.find_by(username:params[:username])
       @rejections=@user.rejections
       if @rejections.length==0
         @rejections=[]
       end
      render json: {user: { id:@user.id,f_name: @user.f_name, l_name: @user.l_name, username: @user.username, email:@user.email, cohort_name: @user.cohort_name, avatar: @user.avatar, rejections:@rejections}}
       # render json: { user: UserSerializer.new(current_user) }, status: :accepted
     end
    def index
        @users = User.all
        render json: @users
    end



    def create
        @user = User.create!(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token, rejections:[] }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email, :cohort_name, :avatar, :f_name, :l_name)
    end
end
