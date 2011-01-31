Gem::Specification.new do |s|
  s.name = 'camelpunch-paypal'
  s.version = '2.1.3'
  s.description = s.summary = "Paypal IPN integration library for rails and other web applications"
  s.has_rdoc = true

  s.files = %w(init.rb README Rakefile MIT-LICENSE) + Dir['lib/**/*'] + Dir['misc/**/*'] + Dir['test/**/*']
  s.files.reject! { |f| /\/\.\_/ }
  s.require_path = 'lib'
  s.autorequire  = 'paypal'
  s.authors = ["Tobias Luetke", "Andrew Bruce"]
  s.email = ["tobi@leetsoft.com", "andrew@camelpunch.com"]
  s.homepage = "http://dist.leetsoft.com/api/paypal"

  s.add_dependency('money')
  s.add_dependency('activesupport', '>= 3.0.3')

  s.add_development_dependency('rake')
  s.add_development_dependency('actionpack')
end
