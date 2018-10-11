require 'ordered_unrolled_linked_list'
module OrderedUnrolledLinkedList
  RSpec.describe List do
    describe 'new' do
      it 'creates a new list' do
      list = described_class.new([1,2,3])
      end
    end
  end
end
