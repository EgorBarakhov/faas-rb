# frozen_string_literal: true

module AuthenticableGraphqlUser
  extend ActiveSupport::Concern

  private

  def ready?(*)
    return true if current_user

    raise execution_error(error_data: authentication_error)
  end

  def authentication_error
    { message: I18n.t('errors.messages.invalid_credentials'), status: 401, code: :unauthorized }
  end
end
