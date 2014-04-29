# Set local environment variables... securely?
env = YAML.load_file(Rails.root.join('config/environment.yml'))[Rails.env]
env.each do |key, value|
  ENV[key.upcase] = value
end