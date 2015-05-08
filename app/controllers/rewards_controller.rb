class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy, :takeoffer]

  # GET /rewards
  # GET /rewards.json
  def index
    @discount_rewards = Reward.where("offer_type = 'Discount'").all
	@promo_rewards = Reward.where("offer_type = 'Promo'").all
  end

  # GET /rewards/1
  # GET /rewards/1.json
  def show
  end

  def takeoffer
    takeup = RewardTakeup.new
	takeup.reward_id = @reward.id
	takeup.user_id = current_user.id
	takeup.save
	
#	log = PointsLog.new
#	log.reward_takeup_id = takeup.id
#	log.policy_id = 1
#	log.circle_id = current_user.circle_id
#	log.credit = 0
#	log.debit = @reward.points_cost
#	log.balance = circle.points
#	log.event_type = "Reward Taken"
#	log.save
	
	circle = Circle.find(current_user.circle_id)
	circle.points = circle.points - @reward.points_cost
	circle.save
	
	redirect_to rewards_path, notice: 'Reward Taken!'
  end
  
  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit
  end

  # POST /rewards
  # POST /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to @reward, notice: 'Reward was successfully created.' }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1
  # PATCH/PUT /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to @reward, notice: 'Reward was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1
  # DELETE /rewards/1.json
  def destroy
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to rewards_url, notice: 'Reward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reward_params
      params.require(:reward).permit(:product_id, :offer_type, :min_circle_size, :min_circle_points, :title, :points_cost, :discount, :desc1, :desc2, :artwork_filename, :status)
    end
end
