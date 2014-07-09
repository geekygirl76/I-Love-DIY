describe Channel do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:sub_id) }
  it { should belong_to(:sub) }
  it { should have_many(:posts) }
end