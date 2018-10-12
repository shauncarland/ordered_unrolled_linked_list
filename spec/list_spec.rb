require 'ordered_unrolled_linked_list'
module OrderedUnrolledLinkedList
  RSpec.describe List do
    describe '#new' do
      it 'creates a new list' do
        list = described_class.new
        expect(list.max_node_length).to eq(5)
      end

      # describe 'with data' do
      #   it 'creates a head node with the data' do
      #     list = described_class.new({ data: [1,2,3] })
      #     expect(list.head.data).to eq([1,2,3])
      #   end
      # end
    end

    describe '#add' do
      let(:list) { described_class.new }
      describe 'adding to an empty list' do
        it 'adds the item to the head node' do
          list.add(1)
          expect(list.head.data).to eq([1])
        end

        describe 'adding beyond the head nodes capacity' do
          it 'creates a new node' do
            6.times { list.add(1) }
            expect(list.head.next.data).to eq([1])
          end
        end
      end
      # describe 'when adding to an unfilled head node' do
      #   let(:list) { described.class.new([1,2,4]) }
      #
      #   it 'adds an item to the head node in the correct order' do
      #     list.add(3)
      #     expect(list.head.data).to eq([1,2,3,4])
      #   end
      # end
    end
  end
end
