class TwilioDevice
  constructor: ->
    @initTwilioDeviceBindings()
    @initFormBindings()

  initTwilioDeviceBindings: ->
    twilio_token = $('#twilioToken').data('token')
    twilio_device = Twilio.Device

    # Create the Client with a Capability Token
    twilio_device.setup(twilio_token, {debug: true});

    #/* Let us know when the client is ready. */
    twilio_device.ready ->
      $("#log").text("Ready")

    #/* Report any errors on the screen */
    twilio_device.error (error) ->
      $("#log").text("Error: " + error.message)

    #/* Log a message when a call connects. */
    twilio_device.connect (conn) ->
      $("#log").text("Successfully established call")

    #/* Log a message when a call disconnects. */
    twilio_device.disconnect (conn) ->
      $("#log").text("Call ended")

  initFormBindings: ->
    $('#caller').bind "click", (event) ->
      params = {"phone_number": $('#phoneNumber').val()}
      Twilio.Device.connect(params)

    $('#hangup').bind "click", (event) ->
      Twilio.Device.disconnectAll()

$ ->
  new TwilioDevice()