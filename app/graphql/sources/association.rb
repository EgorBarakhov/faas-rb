# frozen_string_literal: true

module Sources
  class Association < ::GraphQL::Dataloader::Source
    def initialize(associations, scope = nil) # rubocop:disable Lint/MissingSuper
      @associations = associations
      @scope = scope
    end

    def fetch(records)
      ::ActiveRecord::Associations::Preloader.new(records:, associations:, scope:).call
      records.map { |record| record.public_send(@association_name) }
    end

    # https://github.com/rmosolgo/graphql-ruby/blob/821ca53048fa5803fb90596719b4fedd65029ecb/lib/graphql/dataloader/source.rb#L113-L129
    def self.batch_key_for(*batch_args, **batch_kwargs)
      [*batch_args.map { |arg| arg.try(:to_sql) || arg }, **batch_kwargs]
    end

    private

    attr_reader :associations, :scope
  end
end
