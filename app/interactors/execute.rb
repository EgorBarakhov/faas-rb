# frozen_string_literal: true

class Execute
  include Interactor::Organizer

  organize ::Function::FindOrInitialize,
    ::Function::Validate,
    ::Function::Call,
    ::Function::SaveRecord
end
