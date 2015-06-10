require "active_support/inflector"

class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_service_file
    template 'service.rb', "app/services/#{file_name}_service.rb"
  end

  def copy_service_spec_file
    template 'service_spec.rb', "spec/services/#{file_name}_service_spec.rb"
  end

  private

  def class_name
    file_name.classify
  end
end
