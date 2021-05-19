require 'spec_helper'
require 'support/levels_setup'

shared_examples "level_rewardable"  do
  include_context 'basic levels setup'

  subject { described_class.new }

  describe 'level up' do
    subject { described_class.create! }

    context 'with no level up' do
      describe 'do not apply rewards' do
        it 'tax remains' do
          expect {
            subject.update_attribute(:reputation, 9)
          }.to_not change { subject.reload.tax }
        end
      end
    end

    context 'with single level up' do
      describe 'apply rewards' do
        it 'has tax and coins rewards applied' do
          expect {
            subject.update_attribute(:reputation, 10)
          }.to change { subject.reload.tax }.from(30).to(29)
            .and change { subject.reload.coins }.from(0).to(7)
        end
      end
    end

    context 'with multi level up' do
      describe 'apply rewards' do
        it 'has tax and coins rewards applied' do
          expect {
            subject.update_attribute(:reputation, 13)
          }.to change { subject.reload.tax }.from(30).to(26)
            .and change { subject.reload.coins }.from(0).to(17)
        end
      end
    end
  end
end
