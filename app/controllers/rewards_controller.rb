# frozen_string_literal: true

# RewardsController is responsible for managing reward resources.
class RewardsController < ApplicationController
  before_action :set_child, only: %i[index new create edit update destroy]
  before_action :set_reward, only: %i[index edit update destroy]

  def index; end

  def new
    @reward = Reward.new
  end

  def edit
    @reward = @rewards.find(params[:id])
  end

  def create
    @reward = Reward.new(reward_params.merge(child_id: @child.id, payday_id: @child.payday.id))

    if @reward.save
      flash[:notice] = 'ご褒美を設定しました'
      redirect_to child_rewards_path
    else
      flash[:alert] = @reward.errors.full_messages.join(', ')
      redirect_to new_child_reward_path(@child)
    end
  end

  def update
    @reward = @rewards.find(params[:id])
    if @reward.update(reward_params)
      flash[:notice] = 'ご褒美を登録しました'
      redirect_to child_rewards_path
    else
      flash[:warning] = '登録が失敗しました'
      render :edit
    end
  end

  def destroy
    @reward = @rewards.find(params[:id])
    @reward.destroy!
    redirect_to child_rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:pieces, :pt_range, :pt_addition, :body, :unit)
  end

  def set_child
    @child = current_parent.children.find(params[:child_id])
  end

  def set_reward
    @rewards = @child.rewards
    @payday = @child.payday
  end
end
