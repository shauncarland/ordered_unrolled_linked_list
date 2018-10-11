module OrderedUnrolledLinkedList
  class Node
    attr_accessor :data, :prev, :next
    def initialize(attributes = {})
      @data = attributes[:data] || []
      @prev = attributes[:prev]
      @next = attributes[:next]
    end

    def length
      @data.length
    end

    def max
      @data.max
    end

    def min
      @data.min
    end

    def sort
      @data.sort
    end

    def sort!
      @data.sort!
    end
  end
end
