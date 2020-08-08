class Model < ApplicationRecord
  # Direct associations

  has_many   :terminating_direct_associations,
             :class_name => "DirectAssociation",
             :foreign_key => "terminus_model_id",
             :dependent => :destroy

  has_many   :originating_direct_associations,
             :class_name => "DirectAssociation",
             :foreign_key => "origin_model_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
