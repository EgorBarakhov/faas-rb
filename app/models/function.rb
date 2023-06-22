# frozen_string_literal: true

class Function < ApplicationRecord
  include UUIDTools

  NONCE_EXPIRATION = 1.minute
  NONCE_REGENERATION = 10.seconds

  validates :eth_account, presence: true, uniqueness: true, eth_address: true
  validates :nonce, nonce_in_past: true, allow_nil: true

  def allowed_to_update_nonce?
    return true if nonce.blank?

    nonce_generated_at.before?(Time.zone.now - NONCE_REGENERATION)
  end

  def nonce_generated_at
    return nil if nonce.blank?

    @nonce_generated_at ||= UUID.parse(nonce).timestamp
  end
end
