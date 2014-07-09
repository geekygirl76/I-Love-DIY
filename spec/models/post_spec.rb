

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:sub_id) }
  it { should validate_presence_of(:channel_id) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:sub) }
  it { should belong_to(:owner) }
  it { should have_many(:comments) }
end

