# frozen_string_literal: true

# ParentsController is responsible for managing parent resources.
class ParentsController < ApplicationController
  def show
    @parent = Parent.find(params[:id])
  end
end
