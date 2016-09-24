class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :check_signin, only: [:select_plan]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_plan
    current_user.create_user_plan(sub_plan_id: params[:sub_plan_id])
    respond_to do |format|
      if current_user.user_info.present?
        format.html { redirect_to user_info_path(current_user.user_info), success: 'You have successfully selected the best plan for yourself.' }
        format.json { head :no_content }
      else
        format.html { redirect_to plans_url, success: 'You have successfully selected the best plan for yourself.' }
        format.json { head :no_content }
      end
    end
  end

  # def change_plan
  #   current_user.user_plan.update(sub_plan_id: params[:sub_plan_id])
  #   respond_to do |format|
  #     format.html { redirect_to user_info_path(current_user.user_info), notice: 'You have successfully selected the best plan for yourself.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name)
    end

    def check_signin
      if !user_signed_in?
        respond_to do |format|
          message = 'If you want to be a part of our family,
          kindly register with us and enjoy the fun of joint family. :) OR
          if you are already part of this fun you can directly log in :D'
          format.html{
            redirect_to new_user_session_path, notice: message
          }
        end
      end
    end
end
