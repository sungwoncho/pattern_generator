class PoroGenerator < BaseGenerator
  source_root File.expand_path('../templates', __FILE__)

  private

  def folder_name
    "models"
  end

  def pattern_name
    "poro"
  end

  def suffix
    ""
  end
end
