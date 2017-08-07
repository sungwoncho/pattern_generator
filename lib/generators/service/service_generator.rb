class ServiceGenerator < BaseGenerator
  source_root File.expand_path('../templates', __FILE__)

  private

  def pattern_name
    "service"
  end
end
