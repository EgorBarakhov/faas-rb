# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  post '/:contract_id/triggers/:trigger_id', to: 'trigger#execute'
end
