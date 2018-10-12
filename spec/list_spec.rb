require 'ordered_unrolled_linked_list'
module OrderedUnrolledLinkedList
  RSpec.describe List do
    describe '#new' do
      it 'creates a new list' do
        list = described_class.new
        expect(list.max_node_length).to eq(5)
      end

      describe 'with data' do
        it 'creates a head node with the data' do
          list = described_class.new({ data: [1,2,3] })
          expect(list.head.data).to eq([1,2,3])
        end
      end
    end

    describe "#to_s" do
      let(:list) { described_class.new({ data: [1,2,3,4] })}
      it 'prints the list' do
        expect(list.to_s).to eq("1 2 3 4")
      end
    end

    describe '#add' do
      let(:max_node_length) { 5 }
      let(:list) { described_class.new({ max_node_length: max_node_length }) }
      describe 'adding to an empty list' do
        it 'adds the item to the head node' do
          list.add(1)
          expect(list.head.data).to eq([1])
        end
      end

      describe 'adding to a non-empty list' do
        context 'when there is one node in the list' do
          context 'and the node is not at full capacity' do
            before(:each) { [1,2,4].each { |e| list.add(e) } }

            describe 'and an element is added to the list' do
              it 'puts the element in the correct order' do
                list.add(3)
                expect(list.head.data).to eq([1,2,3,4])
              end
            end
          end

          context 'and the node is at full capacity' do
            before(:each) { max_node_length.times { list.add(1) } }

            describe 'and an element is added to the list' do
              it 'creates a new node' do
                list.add(1)
                expect(list.head.data).to eq([1,1,1,1,1])
                expect(list.head.next.data).to eq([1])
              end
            end
          end
        end
      end
    end
  end
end
