module CommentsHelper
  def user_is_authorized_to_delete_comment?(comment)
    current_user && (current_user == comment.user || current_user.moderator? || current_user.admin?)
  end
end
