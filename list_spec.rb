require 'rspec'
require './list.rb'
require 'pry'

describe List do
  let(:list) { List.new }

  it 'starts out with a length of 0' do
    expect(list).to respond_to(:length)
    expect(list.length).to eq(0)
  end

  it 'should not allow the length be assigned' do
    expect(list).to_not respond_to(:length=)
  end

  it 'should respond to push and pop' do
    expect(list).to respond_to(:push).with(1).argument
    expect(list).to respond_to(:pop).with(0).argument
  end

  it 'should push items to the end of the list and remove them' do
    list.push(1)
    expect(list.length).to eq(1)
    list.push(2)
    expect(list.length).to eq(2)

    expect(list.pop).to eq(2)
    expect(list.length).to eq(1)
    expect(list.pop).to eq(1)
    expect(list.length).to eq(0)

    expect(list.pop).to be_nil
    expect(list.length).to eq(0)
  end

  it 'should respond to [] accessors' do
    expect(list).to respond_to(:[]).with(1).argument
    expect(list).to respond_to(:[]=).with(2).argument
  end

  it 'returns nil if the index is out of bounds' do
    expect(list[-99]).to be_nil
    expect(list[0]).to be_nil
    list.push(10)
    expect(list[1]).to be_nil
  end

  it 'returns the value at the given index' do
    list.push(1)
    list.push(2)
    expect(list[0]).to eq(1)
    expect(list[1]).to eq(2)
  end

  it 'reassigns a value at a given index' do
    list.push(1)
    expect(list[0]).to eq(1)

    list[0] = 5
    expect(list[0]).to eq(5)
  end
end
