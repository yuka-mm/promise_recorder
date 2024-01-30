class RewardsController < ApplicationController
  before_action :set_reward, only: %i[index edit update]

  def index
    @payday = @child.payday
  end

  def new
    @reward = Reward.new(child_id: params[:child_id])
  end

  def edit; end

  def create
    @child.find(params[:child_id])
  end

  def update
  end

  private

  def set_reward
    @child = Child.find(params[:child_id])
    @rewards = @child.rewards
  end
end
