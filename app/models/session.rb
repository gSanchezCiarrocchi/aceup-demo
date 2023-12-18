class Session < ApplicationRecord
  ### Associations
  belongs_to :client
  belongs_to :coach

  ### Validations
  validates :start, presence: true
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 15 }

  validate :session_cannot_overlap

  ### Scopes
  scope :sessions_in_day, ->(date) {where start: date.beginning_of_day..date.end_of_day }

  ### Methods
  def session_end
    start + duration.minutes
  end

  private

  def session_cannot_overlap
    day_sessions = self.class.sessions_in_day(start).where coach: coach
    return unless day_sessions.any? { |session| (session.start..session.session_end).cover? start }

    errors.add :start, "This time period is already scheduled for coach #{coach.name}"
  end
end
