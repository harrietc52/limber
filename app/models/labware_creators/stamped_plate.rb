# frozen_string_literal: true

require_dependency 'form'
require_dependency 'labware_creators'

module LabwareCreators
  class StampedPlate < Base
    extend SupportParent::PlateOnly
    self.default_transfer_template_name = 'Custom pooling'

    private

    def transfer_material_from_parent!(child_uuid)
      api.transfer_template.find(transfer_template_uuid).create!(
        source: parent_uuid,
        destination: child_uuid,
        user: user_uuid,
        transfers: transfer_hash
      )
    end

    def transfer_hash
      WellHelpers.stamp_hash(labware.size)
    end
  end
end
