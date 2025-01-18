namespace :import_data do
  # Import data from the old app from CSV files
  # Files will be located in the import_files directory
  # Files will not be committed to the repository
  require "csv"

  # This is a starting point for the import process
  # We will refactor for elegance

  desc "Import Providers and Associate With Regions"
  task providers: :environment do
    file_path = Rails.root.join("import_files", "Providers.csv")
    data = CSV.read(file_path, headers: true)
    data.each do |row|
      provider = Provider.find_or_create_by!(name: row["Provider_Name"], provider_type: row["Provider_Type"])
      region = Region.find_or_create_by!(name: row["region_name"])
      # TODO: we need the association table
      # Associate the provider with the region if it is not already associated
      # unless provider.regions.include?(region)
      #   provider.regions << region
      # end
      puts "Provider #{provider.name} associated with region #{region.name}"

      user = User.find_or_create_by!(email_address: "#{row["Provider_Name"].underscore.downcase}@update.me", password_digest: BCrypt::Password.create(row["Provider_Password"]), is_admin: false)
      # TODO: add provider_id once that association is in place
      puts "User #{user.email_address} created"
    end
  end

  desc "Import Topics and their associations"
  task topics: :environment do
    file_path = Rails.root.join("import_files", "Topics.csv")
    data = CSV.read(file_path, headers: true)
    data.each do |row|
      topic = Topic.find_or_create_by!(name: row["Topic_Name"])
      provider = Provider.find_by(name: row["Provider_Name"])
      topic.providers << provider
      puts "Topic #{topic.name} associated with provider #{provider.name}"
    end
    
  end
end
