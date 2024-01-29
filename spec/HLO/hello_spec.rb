require_solution 'HLO'

describe Hello do
  subject { Hello.new }

  let(:friend_name) { 'John' }

  it "says hello to the world" do
    expect(subject.hello(friend_name)).to eq "Hello, #{friend_name}!"
  end
end
