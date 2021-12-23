Rails.application.config.generators do |g|
  g.skip_routes true
  g.helper false
  g.stylesheets false
  g.javascripts true
  g.template_engine :erb
end
