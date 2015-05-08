class HomeController < ApplicationController

	def index
	
		if Circle.find(current_user.circle_id).group_code == "Aviva"
			redirect_to rewards_path
		elsif Circle.find(current_user.circle_id).group_code == "Empty"
			redirect_to circles_join_path
		elsif Policy.where("user_id = ?", current_user.id).count == 0
			redirect_to policies_setup_path
		end
		
	end

end
