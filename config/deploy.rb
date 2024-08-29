lock "~> 3.10"    # 1

set :application, "blog_app"    # 2
set :repo_url, "https://github.com/EDLGLD/AWS_DEPLOY_TASK.git"    # 3
set :linked_files, %w{config/secrets.yml .env}   # 4
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}   # 5
set :keep_releases, 5   # 6
set :rbenv_ruby, '3.3.0'    # 7
set :log_level, :info   # 8

after 'deploy:finished', 'deploy:restart'   # 10

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end