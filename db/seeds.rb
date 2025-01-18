# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

[ "Global", "Africa", "Oceania", "Asia", "Latin America" ].each do |region_name|
  Region.find_or_create_by!(name: region_name)
end

[ [ "sp", "sp_files" ], [ "en", "en_files" ] ].each do |language|
  Language.find_or_create_by(name: language[0], file_share_folder: language[1])
end

if Rails.env.development?
  User.find_or_create_by(email_address: 'admin@test.test', password_digest: BCrypt::Password.create('password'), is_admin: true)
  User.find_or_create_by(email_address: 'non_admin@test.test', password_digest: BCrypt::Password.create('password'), is_admin: false)
end
