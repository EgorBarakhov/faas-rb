# frozen_string_literal: true

module Users
  class SaveRecord
    include Interactor

    delegate :user, :user_params, to: :context

    def call
      context.fail!(error_data:) unless user.update(user_params)
    end

    private

    def error_data
      { message: I18n.t('errors.messages.invalid_record'), detail: user.errors.to_a }
    end
  end
end
