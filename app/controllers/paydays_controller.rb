# frozen_string_literal: true

# PaydaysController is responsible for managing payday resources.
class PaydaysController < ApplicationController
    before_action :set_payday, only: %i[show edit update]

  def show; end

  def new
    @payday =  Payday.new(child_id: params[:child_id])
  end

  def edit; end

  def create
    @child = Child.find(params[:child_id])
    @payday = Payday.new(payday_params.merge(child_id: @child.id, parent_id: @current_parent.id)) 

    if @payday.save
      flash[:notice] = "通知日を設定しました"
      redirect_to child_payday_path(@child)
    else
      puts "@payday.errors: #{@payday.errors.full_messages}"
      render 'new'
    end
  end

  def update
    if @payday.update(payday_params)
      redirect_to child_payday_path(@payday.child)
    else
      flash.now[:warning] = '登録に失敗しました'
      render :edit
    end
  end

  private

  def payday_params
    params.require(:payday).permit(:date, :week, :end_month, :action_type)
  end

  def set_payday
    @child = Child.find(params[:child_id])
    @payday = @child.payday
  end
end
