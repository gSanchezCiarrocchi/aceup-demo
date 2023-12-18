class AuthenticateClient
  include Interactor

  def call
    client = Client.find_by email: context.email
    context.fail! message: "Client is not registered" unless client

    context.client = client
  end
end
