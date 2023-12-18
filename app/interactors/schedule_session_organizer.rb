class ScheduleSessionOrganizer
  include Interactor::Organizer

  organize FindCoach, ScheduleNewSession #TODO: This could be another interaction -> SendConfirmationEmail
end
