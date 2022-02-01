class CommentsController < ApplicationController
    def create_table
        @Comment = current_user.build(comment_params)
    end

    def comment_params
        params.require(:comment).permit(:content)
    end
end
