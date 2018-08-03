require 'spec_helper'

describe Book do
  it 'should not be created without a title' do
    book = Book.new
    expect(book.save).to be_falsy
    expect(book.errors.keys).to eq([:title])
  end
end
