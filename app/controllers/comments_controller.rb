class CommentsController < ApplicationController

def create
    # Find our parent decision that we should attach to
    comment = Comment.new(body: params[:body], post_id: params[:post_id])
    # Attach this criterion to a decision
    if comment.save
      redirect_to post_path(params[:post_id])
    else
      render 'new'
    end
  end


end
