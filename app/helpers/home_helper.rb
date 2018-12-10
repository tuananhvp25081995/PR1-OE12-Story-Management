module HomeHelper
  def has_like story_id, member_id
    Follow.find_by story_id: story_id, member_id: member_id
  end
end
