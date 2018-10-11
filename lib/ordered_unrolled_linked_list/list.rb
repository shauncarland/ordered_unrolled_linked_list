module OrderedUnrolledLinkedList
  class List
    def initialize(data = [])
      @list = initialize_new_list(data)
    end

    def initialize_new_list(data)
      data.each { |e| add(e) }
    end
  end
end
