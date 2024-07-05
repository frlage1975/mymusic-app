require 'rest-client'
require 'json'

namespace :db do
  desc 'Populate countries table from API'
  task populate_countries: :environment do
    response = RestClient.get('https://restcountries.com/v3.1/all')
    countries = JSON.parse(response.body)

    countries.each do |country_data|
      name = country_data['name']['common']
      Country.create(name: name)
    end

    puts 'Countries have been populated successfully.'
  end
end
