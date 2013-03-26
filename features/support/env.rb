require 'capybara'
require 'rspec'

After do
  pid = `ps ux | grep '[h]onest_abe.ru' | cut -d" " -f2`
  Process.kill("KILL", pid.to_i)
end
