namespace :import_data do
  # Import data from the old app from CSV files
  # Files will be located in the import_files directory
  # Files will not be committed to the repository
  require "csv"

  # This is a starting point for the import process
  # We will refactor for elegance
  # It is not idempotent; it presumes a clean database except for seeds

  desc "All"
  task all: [ :regions, :providers, :topics ]

  desc "Import Providers and Associate With Regions"
  task providers: :environment do
    file_path = Rails.root.join("import_files", "Providers.csv")
    data = CSV.read(file_path, headers: true)
    data.each do |row|
      # TODO: add old_provider_id to Provider model
      provider = Provider.find_or_create_by!(name: row["Provider_Name"], provider_type: row["Provider_Type"])
      region = Region.find_or_create_by!(name: row["region_name"])
      # TODO: we need the association table
      # Associate the provider with the region if it is not already associated
      # unless provider.regions.include?(region)
      #   provider.regions << region
      # end
      puts "Provider #{provider.name} associated with region #{region.name}"

      user = User.find_or_create_by!(email_address: "#{row["Provider_Name"].underscore.downcase}@update.me", password_digest: BCrypt::Password.create(row["Provider_Password"]), is_admin: false)
      user.update(provider_id: provider.id)
      puts "User #{user.email_address} created"
    end
  end

  desc "Import Topics and their associations"
  task topics: :environment do
    file_path = Rails.root.join("import_files", "Topics.csv")
    data = CSV.read(file_path, headers: true)
    data.each do |row|
      # look up provider by old_provider_id
      provider = Provider.find_by(old_provider_id: row["Provider_ID"])
      # Language IDs should correspond to the IDs in old app
      # TODO: verify before final import
      topic = Topic.find_or_create_by!(name: row["Topic_Name"], provider_id: provider.id, description: row["Topic_Desc"],
          language_id: row["Language_ID"], uid: row["Topic_UID"], state: determine_state(row["Topic_Archived"], old_topic_id: row["topic_id"]))
      puts "Topic #{topic.name} created"
    end
  end

  def determine_state(archived)
    # TODO: validate against state enumerable
    archived ? "archived" : "published"
  end
end
