class FindCoach
  include Interactor

  def call
    name  = context.coach_name
    coach = Coach.find_by name: name
    context.fail! message: "Coach #{name} does not exist" unless coach

    context.coach = coach
  end
end
