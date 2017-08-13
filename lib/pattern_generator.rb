require "rails/generators"

require_relative "./generators/base_generator"

%w(form policy poro service).each do |pattern|
  require_relative "./generators/#{pattern}/#{pattern}_generator"
end

module PatternGenerator
end
