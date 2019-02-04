class Api::V1::RejectionsController < ApplicationController
    def index
        @rejections = Rejection.all
        render json: @rejections
    end
end
