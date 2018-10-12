module OrderedUnrolledLinkedList
  class List
    DEFAULT_MAX_NODE_LENGTH = 5

    attr_reader :max_node_length, :list, :head

    def initialize(attributes = {})
      attributes[:data]  ||= []
      @max_node_length = attributes[:max_node_length] || DEFAULT_MAX_NODE_LENGTH
      @head = Node.new
      @list = initialize_new_list(attributes[:data])
    end

    def initialize_new_list(data)
      data.each { |e| add(e) }
    end

    def add(e)
      if @head.data.empty?
        @head.data << e
        return
      end

      cur_node = @head

      until cur_node.next.nil? do
        if e < cur_node.max
          insert_in_node(e, cur_node)
          return
        else
          cur_node = cur_node.next
        end
      end

      insert_in_node(e, cur_node)
    end

    def to_s
      cur_node = @head
      str = ""

      until cur_node.nil? do
        cur_node.data.each { |a| str += "#{a} " }
        cur_node = cur_node.next
      end
      str.strip
    end

    private
    def insert_in_node(e, node)
      node.data << e
      node.data.sort!

      if node.data.length > @max_node_length
        new_node = Node.new({ data: [node.data.pop] })
        insert_new_node(node, new_node)
      end
    end

    def insert_new_node(node, new_node)
      next_node = node.next
      node.next = new_node
      new_node.prev = node
      new_node.next = next_node
      next_node.prev = new_node unless next_node.nil?
    end
  end
end
