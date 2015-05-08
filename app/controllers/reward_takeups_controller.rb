class RewardTakeupsController < ApplicationController
  before_action :set_reward_takeup, only: [:show, :edit, :update, :destroy]

  # GET /reward_takeups
  # GET /reward_takeups.json
  def index
    @reward_takeups = RewardTakeup.all
  end

  # GET /reward_takeups/1
  # GET /reward_takeups/1.json
  def show
  end

  # GET /reward_takeups/new
  def new
    @reward_takeup = RewardTakeup.new
  end

  # GET /reward_takeups/1/edit
  def edit
  end

  # POST /reward_takeups
  # POST /reward_takeups.json
  def create
    @reward_takeup = RewardTakeup.new(reward_takeup_params)

    respond_to do |format|
      if @reward_takeup.save
        format.html { redirect_to @reward_takeup, notice: 'Reward takeup was successfully created.' }
        format.json { render :show, status: :created, location: @reward_takeup }
      else
        format.html { render :new }
        format.json { render json: @reward_takeup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_takeups/1
  # PATCH/PUT /reward_takeups/1.json
  def update
    respond_to do |format|
      if @reward_takeup.update(reward_takeup_params)
        format.html { redirect_to @reward_takeup, notice: 'Reward takeup was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_takeup }
      else
        format.html { render :edit }
        format.json { render json: @reward_takeup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_takeups/1
  # DELETE /reward_takeups/1.json
  def destroy
    @reward_takeup.destroy
    respond_to do |format|
      format.html { redirect_to reward_takeups_url, notice: 'Reward takeup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_takeup
      @reward_takeup = RewardTakeup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_takeup_params
      params.require(:reward_takeup).permit(:reward_id, :user_id)
    end
end
