
describe Comment do
  it { should validate_presence_of(:body) }
  it { should belong_to(:post) }
  it { should belong_to(:user) }
end
