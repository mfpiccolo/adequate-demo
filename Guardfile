# A sample Guardfile
# More info at https://github.com/guard/guard#readme

### Guard::Konacha
#  available options:
#  - :run_all_on_start, defaults to true
#  - :notification, defaults to true
#  - :rails_environment_file, location of rails environment file,
#    should be able to find it automatically
group :javascript do
  guard :konacha, all_on_start: false, start_on_start: false do
    watch(%r{^app/assets/javascripts/(.*)\.coffee(\.coffee)?$}) { |m| "#{m[1]}_test.coffee" }
    watch(%r{^test/javascripts/(.+)/.+_test(\.coffee)$})
  end
end

group :ruby do
  guard :minitest, all_on_start: false, start_on_start: false do
    watch(%r|^test/(.*)_test\.rb|)
    watch(%r|^lib/(.*)([^/]+)\.rb|)  { |m| "test/#{m[1]}#{m[2]}_test.rb" }
    watch(%r|^test/test_helper\.rb|) { "test" }
    watch(%r|^test/support/|)        { "test" }

    watch(%r|^app/controllers/(.*)\.rb|) { |m| "test/controllers/#{m[1]}_test.rb" }
    watch(%r|^app/mailers/(.*)\.rb|)     { |m| "test/mailers/#{m[1]}_test.rb" }
    watch(%r|^app/helpers/(.*)\.rb|)     { |m| "test/helpers/#{m[1]}_test.rb" }
    watch(%r|^app/models/(.*)\.rb|)      { |m| "test/models/#{m[1]}_test.rb" }
    watch(%r|^app/services/(.*)\.rb|)    { |m| "test/services/#{m[1]}_test.rb" }
  end
end
