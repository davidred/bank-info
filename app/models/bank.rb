require 'open-uri'

class Bank < ActiveRecord::Base

  validates :routing_number, presence: true
  validates :name, presence: true


  def self.fetch_bank_info
    open("#{Rails.root}/app/models/concerns/test.txt", 'wb') do |file|
      file << open('http://www.fededirectory.frb.org/FedACHdir.txt').read
    end
  end

  def self.parse_bank_info
    File.readlines("#{Rails.root}/app/models/concerns/test.txt").each do |line|
      next if line.empty? || line.nil?
      bank_match = /^(\d{9}).{26}(.{36})(.{36})(.{20})(\D{2})?(\d{9})(.{10})/.match(line)
      bank_data = create_hash(bank_match)
      bank = self.find_by_routing_number(bank_data[:routing_number])
      if bank
        bank.update!(bank_data) unless bank.to_json == bank_data
      else
        self.create!(bank_data)
      end
    end
  end

  private

  def self.create_hash(bank_data)
    {
      routing_number: bank_data[1].strip,
      name: bank_data[2].strip,
      phone_number: bank_data[7].strip,
      street: bank_data[3].strip,
      city: bank_data[4].strip,
      state: bank_data[5].strip,
      zip_code: bank_data[6].strip
    }
  end

  def to_json
    {
      routing_number: self.routing_number,
      name: self.name,
      phone_number: self.phone_number,
      street: self.street,
      city: self.city,
      state: self.state,
      zip_code: self.zip_code
    }
  end

  def output_json
    {
      name: self.name,
      routing_number: self.routing_number,
      record_type: "Record Type",
      phone_number: self.phone_number,
      address:
      {
        street: self.street,
        street_2: nil,
        city: self.city,
        state: self.state,
        zip_code: self.zip_code
      }
    }
  end
end
