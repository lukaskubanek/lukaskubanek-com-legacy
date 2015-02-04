task :default => :server

task :server do
    exec "bundle exec middleman server"
end

task :build do
    exec "bundle exec middleman build"
end

task :deploy do
    exec "bundle exec middleman build && bundle exec middleman deploy"
end
