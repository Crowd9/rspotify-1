require 'rspotify'
require 'vcr'
require 'webmock/rspec'
require_relative 'authentication_helper'
require 'stringio'
require 'zlib'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = { decode_compressed_response: true }

  c.before_playback do |interaction|
    headers = interaction.response.headers
    content_encoding = headers['Content-Encoding'] || headers['content-encoding']
    next unless content_encoding&.any? { |value| value.to_s.include?('gzip') }

    body = interaction.response.body
    interaction.response.body = Zlib::GzipReader.new(StringIO.new(body)).read
    headers.delete('Content-Encoding')
    headers.delete('content-encoding')
    headers.delete('Content-Length')
    headers.delete('content-length')
  rescue Zlib::GzipFile::Error, Zlib::Error
    # Leave the body untouched if a cassette is already decoded.
  end
end
RSpec.configure do |config|
  config.include AuthenticationHelper
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect

    mocks.verify_partial_doubles = true
  end
end
