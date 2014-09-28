class TwilioTokenGeneratorService

  def process
    capability = twilio_capability()
    capability.generate
  end

  private
  def twilio_capability
    capability ||= Twilio::Util::Capability.new Settings.twilio.account_sid, Settings.twilio.auth_token
    capability.allow_client_outgoing Settings.twilio.call_app_sid
    capability.allow_client_incoming Settings.twilio.incoming_client_name
    capability
  end

end
