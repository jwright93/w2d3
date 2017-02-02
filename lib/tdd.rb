class Array

  def my_uniq

    result = []

    each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
      result = []

      each_index do |i|
        each_index do |j|

          unless i >=j
            result << [i,j] if self[i] + self[j] == 0
          end

        end
      end

      result
  end

  def my_transpose
    result = []

    each_index do |idx|
      sub_array = []

      each do |el|
        sub_array << el[idx]
      end

      result << sub_array
    end

    result
  end

  def stock_picker

    raise "Not enough days" if size < 2


    profits = {}

    each_index do |i|
      each_index do |j|

        unless i >= j
          value = self[j] - self[i]
          profits[value] = [i, j]
        end

      end
    end

    raise 'No profitable day' unless profits.keys.any? { |key| key > 0 }
    profits[profits.keys.max]
  end
end
