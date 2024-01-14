# frozen_string_literal: true

# ChildrenController is responsible for managing child resources.
class ChildrenController < ApplicationController
  def index
    @current_parent = current_parent
    @children = @current_parent.children
  end

  def show; end

  def new; end

  def edit; end

  # セッションに選択された子供の名前を保存
  def select_child
    @selected_child = @children.find(params[:child_id])
    session[:selected_child_name] = @selected_child.name
    redirect_to children_path
  end
end
