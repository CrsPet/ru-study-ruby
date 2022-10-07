module Exercise
  module Arrays
    class << self
      def find_max(array)
        max = array[0]
        (1...array.length).each do |i|
          max = array[i] if array[i] > max
        end
        max
      end

      def replace(array)
        max = find_max(array)
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query, left = 0, right = array.length - 1)
        if right >= left
          mid = left + ((right - left) / 2)
          return mid if array[mid] == query

          return search(array, query, left, mid - 1) if array[mid] > query

          return search(array, query, mid + 1, right)
        end
        -1
      end
    end
  end
end
