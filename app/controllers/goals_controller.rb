class GoalsController < ApplicationController
  
  before_action :find_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
	

	def index
    @goal = Goal.where(user_id: current_user)
	end

	def show
	end

	def new
    @goal = current_user.goals.build
	end

	def create
		@goal = current_user.goals.build(goal_params)
    
    if @goal.save
			redirect_to @goal, notice: "Successfully created new goal"
		else
			render "new"
    end
  end
  
  def edit
	end

	def update
		if @goal.update(goal_params)
			redirect_to @goal
		else
			render 'edit'
		end
	end

	def destroy
		@goal.destroy
		redirect_to root_path, notice: "Successfully deleted goal"
	end

	private

	def goal_params
    params.require(:goal).permit(:name, :description, :start_date, :target_amount, :image, savings_deposits_attributes: [:id, :amount, :date, :_destroy])
	end

	def find_goal
		@goal = Goal.find(params[:id])
	end
end
