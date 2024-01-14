# frozen_string_literal: true

# ParentsController is responsible for managing parent resources.
class ParentsController < ApplicationController
  def show
    @current_parent = current_parent
    @parent_children = @current_parent.children
  end
end
