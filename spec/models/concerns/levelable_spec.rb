require 'spec_helper'
require 'support/levels_setup'

shared_examples "levelable"  do
  include_context 'basic levels setup'

  subject { described_class.new }

  describe 'new levelable' do
    it 'has 0 reputation points' do
      expect(subject.reputation).to eq(0)
    end

    it "has assigned 'First level'" do
      expect(subject.level).to eq(level_1)
    end
  end

  describe 'level up' do
    subject { described_class.create! }

    context 'with no level up' do
      it "remains at 'First level'" do
        expect {
          subject.update_attribute(:reputation, 9)
        }.to_not change { subject.reload.level }
      end
    end

    context 'with single level up' do
      it "level ups from 'First level' to 'Second level'" do
        expect {
          subject.update_attribute(:reputation, 10)
        }.to change { subject.reload.level }.from(level_1).to(level_2)
      end

      it "level ups from 'First level' to 'Second level'" do
        expect {
          subject.update_attribute(:reputation, 11)
        }.to change { subject.reload.level }.from(level_1).to(level_2)
      end
    end

    context 'with multi level up' do
      it "level ups from 'First level' to 'Third level'" do
        expect {
          subject.update_attribute(:reputation, 14)
        }.to change { subject.reload.level }.from(level_1).to(level_3)
      end
    end
  end
end
