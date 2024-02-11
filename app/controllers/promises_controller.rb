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

  def calendar
    @completed_counts = Count.where(promise_id: @promises, completed: true).group(:start_time).count || {}
    @promises_counts = Count.where(promise_id: @promises).group(:start_time).count || {}
    @completed_count_this_month = @child.counts.where(completed: true, start_time: (Date.today.beginning_of_month..Date.today.end_of_month)).count
  end

  def create
    puts promise_params.inspect
    @promise = @promises.new(promise_params)
    puts @promise.inspect 
    if @promise.save
      flash[:notice] = "やくそくを登録しました"
      redirect_to child_promises_path(@child, @promise)
    else
      @promises_all = @promises.all
      @list_promises = @promises_all.where.not(id: nil).page(params[:page])
      flash.now[:notice] = '登録に失敗しました: ' + @promise.errors.full_messages.join(', ')
      Rails.logger.debug(@promise.errors.full_messages.join(', ')) 
      render :index
    end
  end

  def update
    @promise = @promises.find(params[:id])
    puts "アップデート送信時＝"
    puts promise_params.inspect 
    if @promise.update(promise_params)
        puts "アップデート成功時時＝"
        puts @promise.attributes.inspect # 更新後の属性を出力
      flash[:notice] = "やくそくを変更しました"
      redirect_to child_promise_path
    else
        puts "アップデート失敗時＝"
        puts @promise.attributes.inspect # 更新後の属性を出力
        puts @promise.errors.full_messages 
      flash[:notice] = "変更が失敗しました"
      render :edit
    end
  end

  def destroy
    @promise = @promises.find(params[:id])
    @promise.destroy!
    flash[:notice] = "#{@promise.description}を削除しました"
    redirect_to child_promises_path
  end

  private

  def promise_params
    params.require(:promise).permit(:description, :day_of_week, :start_day, :monthly_flag, :hidden_monthly_flag, :frequency, :points)
  end

  def set_child
    @child = Child.find(params[:child_id])
  end

  def set_promise
    @promises = @child.promises
    @rewards = @child.rewards
  end
end
