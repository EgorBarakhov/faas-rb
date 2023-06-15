# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def authenticable?
    return false if nonce.blank?

    user.nonce_generated_at.after?(Time.zone.now - ::User::NONCE_EXPIRATION)
  end

  def update_nonce?
    return true if nonce.blank?

    user.nonce_generated_at.before?(Time.zone.now - ::User::NONCE_REGENERATION)
  end
end
