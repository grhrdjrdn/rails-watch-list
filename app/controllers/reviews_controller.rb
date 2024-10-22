class ReviewsController < ApplicationController

  before_action :set_list, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.list_id = @list.id
    if @review.save
      redirect_to list_path(@list)
    else
      # render :new, status: :unprocessable_entity
      render "lists/show", status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
