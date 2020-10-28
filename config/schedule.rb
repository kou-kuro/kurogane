# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

require File.expand_path(File.dirname(__FILE__) + "/environment")

# rails_env = ENV['RAILS_ENV'] || :development
# set :environment, rails_env
set :environment, Rails.env.to_sym
env :PATH, ENV['PATH']
set :output, "#{Rails.root.to_s}/log/cron.log"

set :job_template, "source $HOME/.zshrc; $(which zsh) -l -c ':job'"
# set :job_template, "/bin/zsh -l -c ':job'"
# set :job_template, "$(which zsh) -l -c 'source $HOME/.zshrc; :job'"

# job_type :rbenv_rake, %q!eval "$(rbenv init -)"; cd :path && :environment_variable=:environment bundle exec rake :task --silent :output!
job_type :rake, "export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"
# job_type :rake, "source ~/.zshrc && export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

# every 1.day, at: ['7:00 am'] do # タスクを処理するペースを記載する。（例は毎朝7時に実行）
every 1.hour do # タスクを処理するペースを記載する。（例は毎朝7時に実行）
  rake 'push_line:push_line_message_morning'
end