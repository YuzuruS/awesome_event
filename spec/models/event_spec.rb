require 'rails_helper'

RSpec.describe Event, :type => :model do
  describe '#name' do
    context 'nilのとき' do
      let(:event) {Event.new(name: nil)}
      it 'valid でないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
    context '空白のとき' do
      let(:event) {Event.new(name: '')}
      it 'valid でないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
    context 'Rails勉強会のとき' do
      let(:event) {Event.new(name: 'Rails勉強会')}
      it 'valid であること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end
    context '50文字のとき' do
      let(:event) {Event.new(name: 'a' * 50)}
      it 'valid であること' do
        event.valid?
        expect(event.errors[:name]).to be_blank
      end
    end
    context '51文字のとき' do
      let(:event) {Event.new(name: 'a' * 51)}
      it 'valid でないこと' do
        event.valid?
        expect(event.errors[:name]).to be_present
      end
    end
    # it { should validate_presence_of(:name)}
    # it { should ensure_length_of(:name).is_at_most(50)}
  end
end
