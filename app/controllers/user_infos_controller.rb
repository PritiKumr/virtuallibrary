class UserInfosController < ApplicationController
  before_action :set_user_info, only: [:show, :edit, :update, :destroy]

  def show
  end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new
  end

  # GET /user_infos/1/edit
  def edit
  end

  # POST /user_infos
  # POST /user_infos.json
  def create
    @user_info = current_user.create_user_info(user_info_params)

    respond_to do |format|
      if current_user.is_active?
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
      else
        format.html { redirect_to plans_url, notice: 'User info was successfully created. Now, select your faviourte plan according to taste.' }
      end
    end
      # if @user_info.save
      #   format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
      #   format.json { render :show, status: :created, location: @user_info }
      # else
      #   format.html { render :new }
      #   format.json { render json: @user_info.errors, status: :unprocessable_entity }
      # end
  end

  # PATCH/PUT /user_infos/1
  # PATCH/PUT /user_infos/1.json
  def update
    respond_to do |format|
      if current_user.is_active?
        format.html { redirect_to @user_info, notice: 'User info was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_info }
      else
        format.html { redirect_to plans_url, notice: 'User info was successfully updated. Now, select your faviourte plan according to taste.' }
      end
    end
  end

  # DELETE /user_infos/1
  # DELETE /user_infos/1.json
  def destroy
    @user_info.destroy
    respond_to do |format|
      format.html { redirect_to user_infos_url, notice: 'User info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info
      @user_info = UserInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_info_params
      params.require(:user_info).permit(:first_name, :last_name, :address1, :address2, :city, :pincode, :avatar, :contact_no, :gender, :plan_id, :status)
    end
end
