class ScheduleNewSession
  include Interactor

  def call
    session = Session.new(
      coach: context.coach,
      client: context.client,
      start: start_time,
      duration: context.duration
    )

    if session.save
      context.session = session
    else
      context.fail! message: session.errors.full_messages.join(', ')
    end
  end

  def start_time
    DateTime.parse context.start
  end
end
