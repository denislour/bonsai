# frozen_string_literal: true

module Base
  class ActionService
    attr_reader :error, :result

    def self.call(...)
      new(...).tap(&:call)
    end

    private_class_method :new

    def initialize
      super()
      @success = true
      @error = nil
      @result = nil
    end

    def call
      @result = execute
    rescue StandardError => error
      @success = false
      @error = error
    end

    def success?
      @success
    end

    def failure?
      !success?
    end

    private

    def execute
      raise NotImplementedError, "#{self.class} must implement #execute"
    end
  end
end
