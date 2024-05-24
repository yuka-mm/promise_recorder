# frozen_string_literal: true

# TopController is responsible for handling top-level actions.
class TopController < ApplicationController
  skip_before_action :login_status

  def top_page; end

  def help_page; end

  def terms_of_service; end

  def privacy_policy; end

  def navigate; end

  def welcome; end
end
