# frozen_string_literal: true

class AfterDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    comparable_date = record.public_send(options.fetch(:with))
    return if comparable_date.blank? || value.after?(comparable_date)

    record.errors.add(attribute, (options[:message] || :must_be_greater_than_start_date))
  end
end
