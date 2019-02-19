class Api::V1::CohortsController < ApplicationController
  def create
      @cohort = Cohort.create(name:params["name"])
  end
  def index
    @cohorts= Cohort.all
    render json: @cohorts
  end
end
