describe Message do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:sender_id) }
  it { should validate_presence_of(:receiver_id) }
  it { should belong_to(:sender) }
  it { should belong_to(:receiver) }
end