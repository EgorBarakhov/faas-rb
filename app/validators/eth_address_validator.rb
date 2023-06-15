# frozen_string_literal: true

class EthAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) unless Eth::Address.new(value).valid?
  rescue Eth::Address::CheckSumError => _e
    record.errors.add(attribute, :invalid)
  end
end
