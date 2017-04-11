require 'rails_helper'

RSpec.describe Event, :type => :model do
  describe '#created_by?' do
    let(:event) { create(:event)}
    subject { event.created_by?(user)}

    context '引数が nil なとき' do
      let(:user) { nil }
      it { should be_falsey }
    end

    context '#owner_id と 引数の#id が同じ時' do
      let(:user) { double('user', id:event.id)}
      it { should be_truthy}
    end
  end
end
