require 'sinatra'
require 'json'

require_relative 'response/binary'
require_relative 'response/user'

set :port, 3000

error 400..503 do
  {
    error: true,
    message: body[0] || 'Unknown error'
  }.to_json
end

get '/' do
  {
    message: 'Hello world'
  }.to_json
end

post '/api/users/:app_owner_name/apps' do |app_owner_name|
  halt 404, "#{app_owner_name} is not found" unless app_owner_name.start_with?("owner_")

  _, auth_token = request.env["HTTP_AUTHORIZATION"]&.split(" ", 2)

  halt 401, 'Unauthorized' if auth_token.nil? || auth_token.empty?

  file_param = params["file"]

  halt 400, 'file is required' if file_param.nil?

  tempfile = file_param["tempfile"]

  halt 400, 'file is not a filepart' if tempfile.nil?

  user = User.create(
    name: app_owner_name
  )

  status 201

  {
    error: false,
    results: Binary.create(
      name: 'com.deploygate.example',
      package_name: 'com.deploygate.example',
      os_name: 'Android',
      version_code: 1,
      version_name: '1.0',
      sdk_version: 26,
      target_sdk_version: 26,
      signature: '0ee66cf426fabc7455b6aef92eca60ab84deb387',
      md5: 'bfd191eb6083d5203392c6b03668dbad',
      revision: 18,
      file_size: 10000,
      message: 'A build message',
      updated_at: 1673597091,
      user: user
    )
  }.to_json
end
