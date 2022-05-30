require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#title_length' do
    context 'when title present' do
      let(:post) { FactoryBot.create(:post, title: 'Title') }
      it 'return title length' do
        expect(post.title_length == 'Title'.length).to eq true
      end
    end 

    context 'when title blank' do
      let(:post) { FactoryBot.create(:post, title: nil) }
      it 'return true' do
        expect(post.title_length == nil).to eq true
      end
      
      it 'return false' do
        expect(post.title_length == 0).to eq false
      end
    end
  end
end
