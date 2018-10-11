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

    def add(data)
      cur_node = @head
      # find the array that the item needs to be in
    end
  end
end
