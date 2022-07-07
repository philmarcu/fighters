require 'rails_helper'

RSpec.describe Fighter do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :rank }
    it { should validate_presence_of :style }
  end

  describe 'relationships' do
    it { should have_many :moves }
  end
end