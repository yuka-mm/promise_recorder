# frozen_string_literal: true

# ChildrenController is responsible for managing child resources.
class ChildrenController < ApplicationController
  before_action :set_child, only: %i(show edit)

  def index
    @current_parent = current_parent
    @children = @current_parent.children
  end

  def show; end

  def new
    @child = Child.new
  end

  def edit; end

  def create
    @child = current_parent.children.build(child_params)
    if @child.save!
      redirect_to children_path
    else
      render :new
    end
  end

  def update; end

  def destroy; end

  # セッションに選択された子供の名前を保存
  def select_child
    @selected_child = @children.find(params[:child_id])
    session[:selected_child_name] = @selected_child.name
    redirect_to children_path
  end

  private

  def child_params
    params.require(:child).permit(:name, :birth_date)
  end
end

def set_child
  @child = Child.find(params[:id])
end
