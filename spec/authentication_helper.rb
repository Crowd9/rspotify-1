module AuthenticationHelper
  CLIENT_ID = '5ac1cda2ad354aeaa1ad2693d33bb98c'
  CLIENT_SECRET = '155fc038a85840679b55a1822ef36b9b'
  CLIENT_TOKEN = 'BQBj_AiSFlKCkNIMbCWEYjuJLl6n76QmVsHU6MGDgTUBLZqNiKZ4ALs6Kvm6ulbsW9O81JDdIHyXBndXyhUOxg'

  def authenticate_client
    VCR.use_cassette('authenticate:client') do
      RSpotify.authenticate(CLIENT_ID, CLIENT_SECRET)
    end
  end
end
