class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def copy_service_file
    copy_file 'service.rb', "#{file_name}_service.rb"
  end
end
