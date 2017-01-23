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
     on roles(:app) do
       within "#{current_path}" do
         with rails_env: :production do
           execute :rake, "db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1 "
         end
       end
     end
   end

   task :console do
      on roles(:app) do
        within "#{current_path}" do
          with rails_env: :production do
            execute :rails, "console"
          end
        end
      end
    end
end
