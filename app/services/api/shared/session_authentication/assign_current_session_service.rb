# frozen_string_literal: true

module Api
  module Shared
    module SessionAuthentication
      class AssignCurrentSessionService < Base::ActionService
        def initialize(session:)
          super()
          @session = session
        end

        private

        def execute
          Current.session = @session
        end
      end
    end
  end
end
