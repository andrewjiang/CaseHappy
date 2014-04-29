# Set local environment variables... securely?
unless Rails.env.production?
	env = YAML.load_file(Rails.root.join('config/environment.yml'))[Rails.env]
	env.each do |key, value|
	  ENV[key.upcase] = value
	end
end