class PromisesController < ApplicationController
    before_action :set_child, only: %i[index]
  
  def index
    @promises = @child.promises
  end

  def show; end

  def new

  end

  def edit; end

  def calendar; end

  def list; end

  def create; end

  def update; end

  def destrou; end

  private

  def promise_params; end

  def set_child
    @child = Child.find(params[:child_id])
  end
end
