require_solution 'HLO'

describe Hello do
  subject { Hello.new }

  it "says hello to the world" do
    expect(subject.hello(nil)).to eq 'Hello world'
  end
end
