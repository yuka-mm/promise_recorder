# frozen_string_literal: true

# ChildrenController is responsible for managing child resources.
class ChildrenController < ApplicationController
  before_action :set_child, only: %i[show edit update destroy select_child]

  def index
    @current_parent = current_parent
    @children = @current_parent.children
    @parent_password = current_parent.encrypted_password

      # 当日のcountsとそれに紐づくpromiseを取得
    @counts = @children.flat_map do |child|
      child.promises.flat_map do |promise|
        promise.counts.where(start_time: Date.today)
      end
    end
  end

  def show
    @current_parent = current_parent
    @children = @current_parent.children
    @child_promises = @child.promises

    # それぞれのPromiseからPromiseCountを参照し、今日の日付に対応するものを取得
    @promise_counts_today = @child_promises.flat_map do |promise|
      promise.counts.where(start_time: Date.today)
    end
    # それぞれのPromiseCountからPromiseを参照し、descriptionを取得
    @promise_descriptions_today = @promise_counts_today.map { |promise_count| promise_count.promise.description }
  end

  def new
    @child = Child.new
  end

  def edit; end

  def create
    @child = current_parent.children.build(child_params)
    if @child.save
      redirect_to parent_path
    else
      render :new
    end
  end

  def update
    if @child.update(child_params)
      redirect_to child_path(@child.id)
    else
      flash.now[:warning] = '登録に失敗しました'
      render :edit
    end
  end

  def destroy
    @child.destroy!
    redirect_to root_path
  end

  def check_password  # パスチェック
    @current_parent = current_parent

    if params[:source] == 'children_show'
      check_and_redirect_to_children_show
    elsif params[:source] == 'parents_show'
      check_and_redirect_to_parents_show
    end
  end

  def select_child  # セッションに選択された子供の名前を保存
    Rails.logger.debug('select_child action called')
    session[:selected_child_name] = @child.name
  end

  private

  def child_params
    params.require(:child).permit(:name, :birth_date)
  end

  def set_child
    @child = current_parent.children.find(params[:id])
  end

  def check_and_redirect_to_children_show  # モーダル１　管理ボタン後のパスチェック
    @children = @current_parent.children
    selected_child_id = params[:child_id]
    selected_child = @children.find_by(id: selected_child_id)
  
    if @current_parent.valid_password?(params[:password])
      redirect_to child_path(selected_child)
    else
      handle_failed_password_check
    end
  end

  def check_and_redirect_to_parents_show  # モーダル３　マイページのパスチェック
    if @current_parent.valid_password?(params[:password])
      redirect_to parent_path
    else
      handle_failed_password_check
    end
  end

  def handle_failed_password_check  # パスチェック失敗時
    respond_to do |format|
      format.any { head 422 }
    end
  end
end
