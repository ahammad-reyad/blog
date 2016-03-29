class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create({content: params[:comment][:content], entry_id: params[:entry_id]})
    if @comment.save
      flash[:success] = "Your Comment is Posted"
      entry = Entry.find(params[:entry_id])
      redirect_to entry
    else
      flash[:danger] = "You Should Follow the user"
      #render 'new'
    end
  end

  def new
   @comment	=	Comment.new
   @entry_id = params[:entry_id]
  end



  private

   def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
