# frozen_string_literal: true

class GenerateNonce
  include Interactor::Organizer

  organize ::Users::FindOrInitialize,
    ::Users::GenerateNewNonce,
    ::Users::SaveRecord
end
