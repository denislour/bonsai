module SessionTestHelper
  def sign_in_as(user)
    token = SecureRandom.urlsafe_base64(32)
    Current.session = user.sessions.create!(
      token_digest: Digest::SHA256.hexdigest(token)
    )

    ActionDispatch::TestRequest.create.cookie_jar.tap do |cookie_jar|
      cookie_jar.signed[:session_id] = token
      cookies["session_id"] = cookie_jar[:session_id]
    end
  end

  def sign_out
    Current.session&.destroy!
    cookies.delete("session_id")
  end
end

ActiveSupport.on_load(:action_dispatch_integration_test) do
  include SessionTestHelper
end
