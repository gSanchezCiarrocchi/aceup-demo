# README

This is an empty Rails application to save candidates' time while passing through the AceUp tech assessment.

Good luck with the exercise! 🥳

## Application setup

1. Install gems -> `bundle install`
2. Seed the DB -> `rails db:drop db:setup`
3. Run the specs -> `bundle exec rspec`
4. Start the Rails server -> `rails s -p 3001`
5. Install the frontend dependencies -> `yarn install`
6. Start the frontend -> `yarn start`
7. If the rbowser didn't open automatically, navigate to `http://localhost:3000/`


## Application usage
1. To "login" use any of the `Client` email set in the `seeds.rb` file, e.g. `gabriel@email.com`
2. Select any of the coaches in the dropdown
3. Set a date, in the format yyyy-mm-dd hh:mm.
4. Set a duration
5. Click "Schedule"
6. Check in the `rails console` the `Session.last` register, it should be the one you created.

## Usage considerations
There are 2 different constraints to schedule a session:
- The email used to "login" must be an existing `Client` in the DB. (`gabriel@email.com` is one)
- The `Session` being scheduled must not overlap with any existing session for any given `Coach`, however, sessions for different coaches can be scheduled at the same time, even though this practically won't make sense (a client cannot be in 2 different sessions at the same time). However, this validation was not included
because it is outside the scope of this exercise.


## Design Considerations
- Added unit tests to the models, the interactors, and the controllers.
- I decided to include the gem `interactors` in the project, even though for this simple demo it is an obvious overkill, but lately this has been my go-to approach to handle the business logic. Another alternative was to use more simple service objects, but again, lately I'm more inclined to use the interactor pattern.
- I chose to put the validation logic that checks if a session can be created in the `Session` model (the `ActiveRecord`) as a custom validation (`validate :session_cannot_overlap`). A different approach could be to place the validation logic in an interactor, but I chose to leave it in the `Session` because a session shouldn't be scheduled (in this context, scheduling means creating a `Session` record) if it overlaps with an existing session, so an overlapping session is not a valid session. That's why I placed this logic in a more core layer (ActiveRecord) instead of the interactor.
- I decided to include a raw and very-quickly-and-dirty written React app just to simplify the sheduling of the session.
- If you want to use postman instead to test the API:
  - URL: http://localhost:3001/session'
  - Body:
  ```
    {
      coach_name: "Mr. Pink",
      start_time: "2023-05-08 12:45,
      duration: 60,
      email: "gabriel@email.com"
    }
  ```
- For the specs I included `shoulda-matchers` gem just to simplify them. Also `factory-bot`.
