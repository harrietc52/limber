# frozen_string_literal: true

require_dependency 'presenters/statemachine'
module Presenters::Statemachine
  module Standard
    extend ActiveSupport::Concern

    included do
      include Shared

      # The state machine for plates which has knock-on effects on the plates that can be created
      state_machine :state, initial: :pending do
        StateTransitions.inject(self)

        # These are the states, which are really the only things we need ...
        state :pending do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end

        state :started do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end

        state :processed_1 do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end

        state :processed_2 do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end

        state :passed do
          include StateAllowsChildCreation
          include AllowsLibraryPassing
        end

        state :qc_complete, human_name: 'QC Complete' do
          include StateAllowsChildCreation
          include AllowsLibraryPassing
        end

        state :cancelled do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end

        state :failed do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end

        state :unknown do
          include StateDoesNotAllowChildCreation
          include DoesNotAllowLibraryPassing
        end
      end
    end
  end
end
