class GoalsController < ApplicationController
  
  before_action :find_goal, only: [:show, :edit, :update, :destroy]
	

	def index
    @goal = Goal.all.order("created_at DESC")
	end

	def show
	end

	def new
    @goal = Goal.new
	end

	def create
		@goal = Goal.new(goal_params)
    
    if @goal.save
			redirect_to @goal, notice: "Successfully created new goal"
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
    params.require(:goal).permit(:name, :description, :start_date, :target_amount, :image)
	end

	def find_goal
		@goal = Goal.find(params[:id])
	end
end
