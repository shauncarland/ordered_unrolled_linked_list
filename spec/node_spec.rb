require 'ordered_unrolled_linked_list'
module OrderedUnrolledLinkedList
  RSpec.describe Node do
    describe "#new" do
      it "creates a new node" do
        node = Node.new
      end

      it "creates a new node with data" do
        data = [1,2,3]
        node = Node.new({ data: data })
        expect(node.data).to eq(data)
      end

      it "creates a new node with a previous and next node" do
        prev_node = Node.new
        next_node = Node.new
        node = Node.new({ prev: prev_node, next: next_node })

        expect(node.prev).to eq(prev_node)
        expect(node.next).to eq(next_node)
      end
    end

    describe "#max" do
      it "returns the maximum value" do
        node = Node.new({data: [1,2,3]})
        expect(node.max).to eq(3)
      end
    end

    describe "#min" do
      it "returns the minimum value" do
        node = Node.new({data: [1,2,3]})
        expect(node.min).to eq(1)
      end
    end

    describe "#sort" do
      it "sorts the data" do
        node = Node.new({data: [3,2,1]})
        expect(node.data.sort).to eq([1,2,3])
      end
    end

    describe "#sort!" do
      it "mutates the data in sorted order" do
        node = Node.new({ data: [3,2,1] })
        node.sort!
        expect(node.data).to eq([1,2,3])
      end
    end
  end
end
