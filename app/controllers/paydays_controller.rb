# frozen_string_literal: true

# PaydaysController is responsible for managing payday resources.
class PaydaysController < ApplicationController
    before_action :set_payday, only: %i[show edit update destroy]
  def show
    @payday_child = payday.child
  end

  def new
    @payday =  Payday.new(child_id: params[:child_id])
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  #def payday_params
  #  params.require(:payday).permit(:name, :birth_date)
  #end

  def set_payday
    @payday = Payday.find(params[:id])
  end
end
