# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  authorize :user, allow_nil: true

  def authenticable?
    return false if nonce.blank?

    user.nonce_generated_at.after?(Time.zone.now - ::User::NONCE_EXPIRATION)
  end
end
