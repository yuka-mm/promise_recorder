# frozen_string_literal: true

# ChildrenController is responsible for managing child resources.
class ChildrenController < ApplicationController
  before_action :set_child, only: %i(show edit)

  def index
    @current_parent = current_parent
    @children = @current_parent.children
    @parent_password = current_parent.encrypted_password
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

  def check_password
    @current_parent = current_parent

    if params[:source] == 'children_show'
      check_and_redirect_to_children_show
    elsif params[:source] == 'parents_show'
      check_and_redirect_to_parents_show
    else
      flash[:warning] = 'パスワードが違います'
    end
  end


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

  def set_child
    @child = Child.find(params[:id])
  end

  def check_and_redirect_to_children_show
    @children = @current_parent.children
    selected_child_id = params[:child_id]
    selected_child = @children.find_by(id: selected_child_id)
  
    if @current_parent.valid_password?(params[:password])
      redirect_to child_path(selected_child)
    else
      handle_failed_password_check
    end
  end

  def check_and_redirect_to_parents_show
    if @current_parent.valid_password?(params[:password])
      redirect_to parents_path
    else
      handle_failed_password_check
    end
  end

  def handle_failed_password_check
    respond_to do |format|
      format.js { render 'check_password_failed' }
    end
  end
end
