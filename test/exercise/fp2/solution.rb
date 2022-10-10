module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        yield self[0]
        MyArray.new(self[1..]).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |arr, el| arr << (yield el) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |arr, el| el.nil? ? arr : arr << el }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        return acc if empty?

        arr = self

        if acc.nil?
          acc = self[0]
          arr = MyArray.new(self[1..])
        end

        acc = yield acc, arr[0]
        MyArray.new(arr[1..]).my_reduce(acc, &block)
      end
    end
  end
end
