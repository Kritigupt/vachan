defmodule Vachan.Accounts.Senders.SendPasswordResetEmail do
  @moduledoc """
  Sends a password reset email
  """
  use AshAuthentication.Sender
  use VachanWeb, :verified_routes

  @impl AshAuthentication.Sender
  def send(user, token, _) do
    Vachan.Accounts.Emails.deliver_reset_password_instructions(
      user,
      url(~p"/password-reset/#{token}")
    )
  end
end
