class FormGenerator < BaseGenerator
  source_root File.expand_path("../templates", __FILE__)

  private

  def pattern_name
    "form"
  end
end
