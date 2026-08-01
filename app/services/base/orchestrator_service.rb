# frozen_string_literal: true

module Base
  class OrchestratorService < Base::ActionService
    private

    def action(service_class, **kwargs)
      service = service_class.call(**kwargs)
      raise service.error if service.failure?

      service.result
    end

    def with_transaction(&)
      ActiveRecord::Base.transaction(&)
    end
  end
end
