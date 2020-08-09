# == Schema Information
#
# Table name: associations
#
#  id                                     :bigint           not null, primary key
#  finished                               :boolean          default(FALSE)
#  foreign_key                            :string
#  indirect_associations_as_source_count  :integer
#  indirect_associations_as_through_count :integer
#  name                                   :string
#  nature                                 :integer
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  foreign_key_location_model_id          :bigint
#  idea_id                                :bigint           not null
#  join_table_model_id                    :bigint
#  origin_model_id                        :bigint
#  source_association_id                  :bigint
#  terminus_model_id                      :bigint
#  through_association_id                 :bigint
#
# Indexes
#
#  index_associations_on_foreign_key_location_model_id  (foreign_key_location_model_id)
#  index_associations_on_idea_id                        (idea_id)
#  index_associations_on_join_table_model_id            (join_table_model_id)
#  index_associations_on_origin_model_id                (origin_model_id)
#  index_associations_on_source_association_id          (source_association_id)
#  index_associations_on_terminus_model_id              (terminus_model_id)
#  index_associations_on_through_association_id         (through_association_id)
#
# Foreign Keys
#
#  fk_rails_...  (foreign_key_location_model_id => models.id)
#  fk_rails_...  (idea_id => ideas.id)
#  fk_rails_...  (join_table_model_id => models.id)
#  fk_rails_...  (origin_model_id => models.id)
#  fk_rails_...  (source_association_id => associations.id)
#  fk_rails_...  (terminus_model_id => models.id)
#  fk_rails_...  (through_association_id => associations.id)
#
require 'rails_helper'

RSpec.describe Association, type: :model do
  describe 'Direct Associations' do
    it { should belong_to(:through_association) }

    it { should have_many(:indirect_associations_as_through) }

    it { should belong_to(:source_association) }

    it { should have_many(:indirect_associations_as_source) }

    it { should belong_to(:indirect_terminus_model) }

    it { should belong_to(:indirect_origin_model) }

    it { should belong_to(:direct_terminus_model) }

    it { should belong_to(:direct_origin_model) }

    it { should belong_to(:terminus_model) }

    it { should belong_to(:origin_model) }
  end

  describe 'InDirect Associations' do
  end

  describe 'Validations' do
  end
end
