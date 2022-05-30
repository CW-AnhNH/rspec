require 'spec_helper'
require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let!(:post) { FactoryBot.create(:post) }


  describe "GET #index" do
    it "return an array of posts" do
      get :index
      expect(response).to have_http_status(200)
      expect(assigns(:posts)).to eq([post])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  # ### let

  # describe "GetTime" do
  #   let(:current_time) { Time.now }

  #   it "gets the same time over and over again" do
  #     puts current_time # => 2022-05-30 13:06:52 +0700
  #     sleep(3)
  #     puts current_time # => 2022-05-30 13:06:52 +0700
  #   end

  #   it "gets the time again" do
  #     puts current_time # => 2022-05-30 13:06:55 +0700
  #   end
  # end

  # ### let!
  # describe "GetTime" do
  #   let!(:current_time) { Time.now }

  #   it "gets the time" do
  #     puts current_time # => 2022-05-30 13:09:10 +0700
  #   end

  #   it "gets the time again" do
  #     sleep(3)
  #     puts current_time # => 2022-05-30 13:09:10 +0700
  #   end
  # end

  #### Shared examples
  let(:cat) { FactoryBot.create(:cat, name: "Cat", age: 2) }
  let(:dog) { FactoryBot.create(:dog, name: "Dog", age: 100) }

  # shared_examples 'pet_attributes' do |name, age|
  #   it 'returns its name' do
  #     expect(subject.name).to eq(name)
  #   end

  #   it 'returns an age' do
  #     expect(subject.age).to eq(age)
  #   end
  # end

  # describe '#pet_behavior' do
  #   context 'when pet is a cat' do
  #     it 'returns its name' do
  #       expect(cat.name).to eq("Cat")
  #     end

  #     it 'returns an age' do
  #       expect(cat.age).to eq(2)
  #     end
  #   end

  #   context 'when pet is a dog' do
  #     it 'returns its name' do
  #       expect(dog.name).to eq("Dog")
  #     end

  #     it 'returns an age' do
  #       expect(dog.age).to eq(100)
  #     end
  #   end
  # end

  # #====>

  # shared_examples 'pet_attributes' do |name, age|
  #   it 'returns its name' do
  #     expect(subject.name).to eq(name)
  #   end

  #   it 'returns an age' do
  #     expect(subject.age).to eq(age)
  #   end
  # end

  # describe '#pet_behavior' do
  #   context 'when pet is a cat' do
  #     subject { cat }
  #     it_behaves_like 'pet_attributes', 'Cat', 2
  #   end

  #   context 'when pet is a dog' do
  #     subject { dog }
  #     it_behaves_like 'pet_attributes', 'Dog', 100
  #   end
  # end

  describe 'Before & after hooks' do
    before :context do
      puts "before context"
    end

    after :context do
      puts "after context"
    end

    before :example do
      puts "before example"
    end

    after :example do
      puts "after example"
    end
    # before(:context) run
    # before(:example) run
    # context "test1" do
    #   puts "inside test1"
    #   it { expect("Welcome to RSpec").to match(/RSpec$/) }
    # end
    # after(:example) run

    # before(:example) run
    it { expect(dog).to be_instance_of(Dog) }
    # after(:example) run

    describe "test1" do
      puts "inside test1"
      it { expect("Welcome to RSpec").to match(/RSpec$/) }
      puts "after inside test1"
    end

    # before(:example) run
    it { expect("Welcome to RSpec").to match(/RSpec$/) }
    # after(:example) run

    # before(:example) run
    it { expect(dog).to be_instance_of(Dog) }
    # after(:example) run
    # after(:context) run
  end

  describe 'Method Stubs' do
    let(:post) { FactoryBot.create(:post, title: "Title") }
    before do
      allow(post).to receive(:title) { "The RSpec book" }
    end

    it { expect(post.title).to eq "The RSpec book" }
  end

  describe 'Receive_message_chain' do
    let(:post) { FactoryBot.create(:post, title: "Title") }
    before do
      allow(post).to receive_message_chain(:title, :length) { 20 }
    end

    it { expect(post.title.length).to eq 20 }
  end

  ##### Traits
  context 'Traits' do
    let(:post1) { FactoryBot.create(:post, content: "test") }
    let(:post2) { FactoryBot.create(:post, :my_content) }

    it { expect(post1.content).to eq "test" }
    it { expect(post2.content).to eq "My content" }
  end
end