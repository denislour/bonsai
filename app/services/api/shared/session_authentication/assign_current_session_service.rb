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

          # Gán whodunnit cho PaperTrail — ai đang thực hiện thay đổi.
          # session có → user_id của session; nil (logout) → nil.
          PaperTrail.request.whodunnit = @session&.user_id&.to_s
        end
      end
    end
  end
end
