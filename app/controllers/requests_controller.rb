class RequestsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def list
  end

  private

  def request_params
    params.require(:request).permit(:description, :category_id, :delivery, :budget, :attachment_file, :title)
  end
end
