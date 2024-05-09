class User < Hash
  # @param name [String]
  def self.create(
    name:
  )
    User.new.tap do |u|
      u[:name] = name
      u[:profile_icon] = "https://example.com/#{name}.png"
    end
  end
end
