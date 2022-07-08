require 'rails_helper'

RSpec.describe Move, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :power }
    it { should validate_presence_of :speed }
    it { should validate_presence_of :grade }
    it { should allow_value(true).for(:top_tier)}
    it { should allow_value(false).for(:top_tier)}
  end

  describe 'relationships' do
    it { should belong_to :fighter}
  end
end