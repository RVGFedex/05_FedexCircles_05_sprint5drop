class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]

  # GET /policies
  # GET /policies.json
  def index
    if Role.find(current_user.role_id).name == 'Customer'
		@policies = Policy.where("user_id = ?",current_user.id).all.order(:id)
    else
		@policies = Policy.all
	end	
  end

  # GET /policies/1
  # GET /policies/1.json
  def show
  end

  # GET /policies/new
  def new
    @policy = Policy.new
  end

  # GET /policies/1/edit
  def edit
  end

  def setup
    @policy = Policy.new
  end
  
  def add_points( policy )
	circle = Circle.find( current_user.circle_id )
	prod = Product.find( policy.product_id )
	
	if policy.frequency == "Monthly"
		points = prod.rpweight * policy.premium
	else
		points = prod.spweight * policy.premium	
	end

	circle.points += points
	circle.save
  end  
  
  def create_multi_policies
  
	if (params[:policy_motor].to_s.length > 0)
		@policy1 = Policy.new
		@policy1.user_id = current_user.id
		@policy1.product_id = 2
		@policy1.frequency = "Monthly"
		@policy1.premium = rand(200.0..250.0).round(2)
		@policy1.policy_number = params[:policy_motor].to_s
		@policy1.save
		
		add_points(@policy1)
	end
	
	if (params[:policy_home].to_s.length > 0)
		@policy2 = Policy.new
		@policy2.user_id = current_user.id
		@policy2.product_id = 3
		@policy2.frequency = "Annual"
		@policy2.premium = rand(500.0..600.0).round(2)
		@policy2.policy_number = params[:policy_home].to_s
		@policy2.save
		
		add_points(@policy2)
	end

	if (params[:policy_health].to_s.length > 0)	
		@policy3 = Policy.new
		@policy3.user_id = current_user.id
		@policy3.product_id = 4
		@policy3.frequency = "Monthly"
		@policy3.premium = rand(900.0..1000.0).round(2)
		@policy3.policy_number = params[:policy_health].to_s
		@policy3.save
		
		add_points(@policy3)
	end
		
	if (params[:policy_pension].to_s.length > 0)		
		@policy4 = Policy.new
		@policy4.user_id = current_user.id
		@policy4.product_id = 5
		@policy4.frequency = "Monthly"
		@policy4.premium = rand(900.0..1000.0).round(2)
		@policy4.policy_number = params[:policy_pension].to_s
		@policy4.save
		
		add_points(@policy4)		
	end
	
	if (params[:policy_life].to_s.length > 0)		
		@policy5 = Policy.new
		@policy5.user_id = current_user.id
		@policy5.product_id = 6
		@policy5.frequency = "Monthly"
		@policy5.premium = rand(50.0..75.0).round(2)
		@policy5.policy_number = params[:policy_life].to_s
		@policy5.save
		
		add_points(@policy5)
	end	
	
	if (params[:policy_travel].to_s.length > 0)			
		@policy6 = Policy.new
		@policy6.user_id = current_user.id
		@policy6.product_id = 7
		@policy6.frequency = "Annual"
		@policy6.premium = rand(100.0..200.0).round(2)
		@policy6.policy_number = params[:policy_travel].to_s
		@policy6.save
		
		add_points(@policy6)
	end		

    respond_to do |format|
		format.html { redirect_to policies_path, notice: 'Policies were added.' }
    end
	
  end
  
  def create
    @policy = Policy.new(policy_params)

    respond_to do |format|
      if @policy.save
        format.html { redirect_to @policy, notice: 'Policy was successfully created.' }
        format.json { render :show, status: :created, location: @policy }
      else
        format.html { render :new }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policies/1
  # PATCH/PUT /policies/1.json
  def update
    respond_to do |format|
      if @policy.update(policy_params)
        format.html { redirect_to @policy, notice: 'Policy was successfully updated.' }
        format.json { render :show, status: :ok, location: @policy }
      else
        format.html { render :edit }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1
  # DELETE /policies/1.json
  def destroy
    @policy.destroy
    respond_to do |format|
      format.html { redirect_to policies_url, notice: 'Policy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_policy
      @policy = Policy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def policy_params
      params.require(:policy).permit(:user_id, :product_id, :policy_number, :premium, :frequency, :status)
    end
end
