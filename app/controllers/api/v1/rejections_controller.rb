class Api::V1::RejectionsController < ApplicationController
 # skip_before_action :authorized, only: [:create,:destroy]

    def index
        @rejections = Rejection.all
        render json: @rejections
    end

    def create
      p = params["params"]["rejection"]
      @rejection= Rejection.create(company:p["company"],stage_of_rejection:p["stage_of_rejection"],rejection_url:p["rejection_url"],user_id:p["id"])
     @user=User.find_by(id:p["id"])
     @rejections=@user.rejections
       render json: {user: {id: @user.id, f_name: @user.f_name, l_name: @user.l_name, username: @user.username, email:@user.email, cohort_name: @user.cohort_name, avatar: @user.avatar, rejections:@rejections}}
    end

    def destroy
      @rejection=Rejection.find_by(id:params["id"])
      theId=@rejection["user_id"]
      @user=User.find_by(id:theId)
      @rejection.destroy
      @rejections=@user.rejections
        render json: {user: {id: @user.id, f_name: @user.f_name, l_name: @user.l_name, username: @user.username, email:@user.email, cohort_name: @user.cohort_name, avatar: @user.avatar, rejections:@rejections}}


    end
end
