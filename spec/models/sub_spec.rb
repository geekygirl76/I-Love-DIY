describe Sub do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:manager) }
  it { should have_many(:posts) }
  it { should have_many(:channels) }
end