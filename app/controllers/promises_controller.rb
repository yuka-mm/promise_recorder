class PromisesController < ApplicationController
  before_action :set_child, only: %i[index show edit create update destroy calendar]
  before_action :set_promise, only: %i[index show edit create update destroy calendar]
  
  def index
    @promise = @promises.new
    @list_promises = @promises.where.not(id: nil).page(params[:page])
  end

  def show
    @promise = @promises.find(params[:id])
  end

  def edit
    @promise = @promises.find(params[:id])
  end

  def calendar; end

  def list; end

  def create
    @promise = @child.promises.new(promise_params)
  
    if @promise.save
      flash[:motice] = "やくそくを登録しました"
      redirect_to child_promises_path(@child, @promise)
    else
      @promises = @child.promises.all
      @list_promises = @promises.where.not(id: nil).page(params[:page])
      flash.now[:warning] = '登録に失敗しました: ' + @promise.errors.full_messages.join(', ')
      Rails.logger.debug(@promise.errors.full_messages.join(', ')) 
      render :index
    end
  end

  def update
    @promise = @child.promises.find(params[:id])
    if @promise.update(promise_params)
      flash[:motice] = "やくそくを変更しました"
      redirect_to child_promise_path
    else
      flash[:warning] = "変更が失敗しました"
      render :edit
    end
  end

  def destroy
    @promise = @child.promises.find(params[:id])
    @promise.destroy!
    redirect_to child_promise_path
  end

  private

  def promise_params
    params.require(:promise).permit(:description, :day_of_week, :start_day, :monthly_flag, :frequency, :points)
  end

  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_promise
    @promises = @child.promises
    @rewards = @child.rewards
  end
end
