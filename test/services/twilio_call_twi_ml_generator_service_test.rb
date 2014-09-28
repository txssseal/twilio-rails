require 'test_helper'

class TwilioCallTwiMLGeneratorServiceTest < ActiveSupport::TestCase

  def test_generates_valid_twiml_response
    response = TwilioCallTwiMLGeneratorService.new('1231231234').process
    expected_response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Response><Dial callerId=\"+15005550000\"><Number>123123123</Number></Dial></Response>"
    assert_equal expected_response, response
  end

  def test_invalid_number_leads_to_error_response
    response = TwilioCallTwiMLGeneratorService.new('1231ANS').process
    assert_includes response, "Error"
  end

end
