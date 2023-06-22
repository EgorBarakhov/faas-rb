# frozen_string_literal: true

module Users
  class FindOrInitialize
    include Interactor

    delegate :params, to: :context

    def call
      context.user = ::User.find_or_initialize_by(eth_account: params[:eth_account])
    end
  end
end
