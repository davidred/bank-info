namespace :fetch do
  desc "TODO"
  task fetch_bank_info: :environment do
    puts "fetching bank file from the web"
    Bank.fetch_bank_info
    puts "updating database"
    Bank.parse_bank_info
    puts "completed at #{Time.now}"
  end

end
