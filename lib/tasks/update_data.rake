desc "Running cron to update data from api"
task :cron => :environment do
  puts "*"*80
  puts "Running cron job to update db"
  UpdateCountryStats.call
end
