class Binary < Hash
  # @param name [String]
  # @param package_name [String]
  # @param os_name [String] Android or Ios
  # @param version_code [Integer]
  # @param version_name [String, nil]
  # @param sdk_version [Integer]
  # @param target_sdk_version [Integer]
  # @param signature [String, nil]
  # @param md5 [String]
  # @param revision [Integer]
  # @param file_size [Integer]
  # @param message [String]
  # @param user [User]
  # @param updated_at [Integer]
  def self.create(
    name:,
    package_name:,
    os_name:,
    version_code:,
    version_name:,
    sdk_version:,
    target_sdk_version:,
    signature:,
    md5:,
    revision:,
    file_size:,
    message:,
    user:,
    updated_at:
  )
    Binary.new.tap do |b|
      b[:name] = name
      b[:package_name] = package_name
      b[:os_name] = os_name
      b[:version_code] = version_code
      b[:version_name] = version_name
      b[:sdk_version] = sdk_version.to_i
      b[:raw_sdk_version] = "#{sdk_version}"
      b[:target_sdk_version] = target_sdk_version.to_i
      b[:signature] = signature
      b[:md5] = md5
      b[:revision] = revision
      b[:file_size] = file_size
      b[:message] = message
      b[:user] = user
      b[:updated_at] = updated_at
      b[:labels] = {}
      b[:path] = "/users/#{user[:name]}/platforms/#{os_name.downcase}/apps/#{package_name}"
      b[:icon] = "https://deploygate.com/api/users/#{user[:name]}/platforms/#{os_name.downcase}/apps/#{package_name}/binaries/#{revision}/download/icon"
      b[:file] = "https://deploygate.com/api/users/#{user[:name]}/platforms/#{os_name.downcase}/apps/#{package_name}/binaries/#{revision}/download/binary.apk"
    end
  end
end
