class CountsController < ApplicationController
  def index
    @child = Child.find(params[:child_id])
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @counts = @child.promises.flat_map do |promise|
      promise.counts.where(start_time: date.beginning_of_day)
    end
  end

  def update
    @count = Count.find(params[:id])
    @count.update(completed: !@count.completed)
    render json: { completed: @count.completed }
  end
end
