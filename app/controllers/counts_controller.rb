# frozen_string_literal: true

# CountsController is responsible for managing count resources.
class CountsController < ApplicationController
  def index
    @child = current_parent.children.find(params[:child_id])
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @counts = @child.promises.flat_map do |promise|
      promise.counts.where(start_time: @date.beginning_of_day)
    end
  end

  def update
    @count = Count.find(params[:id])
    @count.update(completed: !@count.completed)
    remaining_count = Count.remaining(@count.promise.child_id, @count.start_time)
    render json: { completed: @count.completed, remaining_count: }
  end
end
