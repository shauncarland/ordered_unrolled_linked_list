require 'ordered_unrolled_linked_list'
module OrderedUnrolledLinkedList
  RSpec.describe List do
    let(:max_node_length) { 5 }

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

    describe "#to_a" do
      let(:list) { described_class.new({ data: [1,2,3,4] })}

      it 'returns an array with the values' do
        expect(list.to_a).to eq([1,2,3,4])
      end
    end

    describe "#inspect" do
      let(:list) do
        described_class.new(
          { data: [1,2,3],
            max_node_length: max_node_length
            }
          )
      end

      describe "when there is one node" do
        let(:max_node_length) { 3 }
        it "returns the inspection for the one node" do
          list_inspection = [
            {
              index: 1,
              data: [1,2,3]
            }
          ]
          expect(list.inspect).to eq(list_inspection)
        end
      end

      describe "when there are multiple nodes" do
        let(:max_node_length) { 2 }

        it "returns the inspections for all of the nodes" do
          list_inspection = [
            {
              index: 1,
              data: [1,2]
            },
            {
              index: 2,
              data: [3]
            },
          ]
          expect(list.inspect).to eq(list_inspection)
        end
      end
    end

    describe '#add' do
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

    describe "#index_of" do
      let(:list) do
        described_class.new(
          { data: [1,2,3,4,5,6,7,8],
            max_node_length: max_node_length
            }
          )
      end

      describe "when the list has one node" do
        let(:max_node_length) { 4 }

        it "returns the correct index" do
          expect(list.index_of(3)).to eq(2)
        end

        describe "and the value is not in the list" do
          it "returns -1" do
            expect(list.index_of(9)).to eq(-1)
          end
        end
      end

      describe "when the list has multiple nodes" do
        let(:max_node_length) { 2 }
      end

      it "returns the correct index" do
        expect(list.index_of(3)).to eq(2)
      end
    end
  end
end
