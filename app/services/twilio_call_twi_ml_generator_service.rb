class TwilioCallTwiMLGeneratorService
  attr_reader :phone_number
  VALID_PHONE_NUMBER_REGEX = /^[\d\+\-\(\) ]+$/ # Matches valid phone numbers acceptable to Twilio

  def initialize phone_number
    @phone_number = phone_number
  end

  # Example Response:
  # <?xml version="1.0" encoding="UTF-8"?>
  # <Response>
  # <Dial callerId="+15005550000">
  # <Number>+15005550001</Number>
  # </Dial>
  # </Response>
  def process
    Twilio::TwiML::Response.new do |r|
      if VALID_PHONE_NUMBER_REGEX.match(phone_number)
        r.Dial :callerId => Settings.twilio.verified_number do |d| # callerId is number from which call is made.
          d.Number(CGI::escapeHTML phone_number) # The number to call
        end
      else
        r.Error("Invalid number!")
      end
    end.text.strip
  end

end

