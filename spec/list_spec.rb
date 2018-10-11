require 'ordered_unrolled_linked_list'
module OrderedUnrolledLinkedList
  RSpec.describe List do
    describe 'new' do
      it 'creates a new list' do
        list = described_class.new
        expect(list.max_node_length).to eq(5)
      # list = described_class.new({data: [1,2,3]})
      end

      describe 'with data' do
        it 'creates a head node with the data' do
          list = described_class.new({ data: [1,2,3] })
          expect(list.head.data).to eq([1,2,3])
        end
      end
    end
  end
end
