guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/telegrambot/(.+)\.rb$})     { |m| "spec/lib/telegrambot/#{m[1]}_spec.rb" }
  watch(%r{^lib/telegrambot/types/(.+)\.rb$})     { |m| "spec/lib/telegrambot/client_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
