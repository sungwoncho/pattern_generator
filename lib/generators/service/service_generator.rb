class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_service_file
    copy_file 'service.rb', "app/services/#{file_name}_service.rb"
  end

  def copy_service_spec_file
    copy_file 'service_spec.rb', "spec/services/#{file_name}_service_spec.rb"
  end
end
