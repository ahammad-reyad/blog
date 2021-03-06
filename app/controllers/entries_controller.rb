class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @entry = Entry.find(params[:id])
    @comment = Comment.new
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end
