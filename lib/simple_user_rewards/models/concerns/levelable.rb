module SimpleUserRewards::Levelable
  extend ActiveSupport::Concern

  included do
    belongs_to :level

    after_initialize do
      self.reputation ||= 0
      self.level ||= matching_level
    end

    before_update :set_new_level, if: :reputation_changed?
  end

  private

  def set_new_level
    if matching_level != self.level
      self.update!(level: matching_level)
    end
  end

  def matching_level
    SimpleUserRewards::Level.where("experience <= #{reputation}")
      .order(:experience)&.last
  end

  def levels_up
    return [] if !level_id_changed?

    old_level = SimpleUserRewards::Level.find level_id_was

    SimpleUserRewards::Level.where(
      "experience > #{old_level.experience} and experience <= #{matching_level.experience}"
    )
  end

  def level_up?
    levels_up.count > 0
  end
end
