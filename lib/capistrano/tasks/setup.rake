namespace :setup do
  desc "Seed the database."
  task :seed_db do
    on roles(:app) do
      within "#{current_path}" do
        with rails_env: :production do
          execute :rake, "db:seed"
        end
      end
    end
  end

  task :reset_db do
    run "cd #{current_path} && bundle exec rake db:reset RAILS_ENV=#{rails_env}"
  end
end