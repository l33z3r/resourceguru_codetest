class Flattener
  def flatten(array:)
    flattened_nums = []

    array.each do |el|
      if el.is_a? Fixnum
        flattened_nums << el
      else
        flattened_nums += flatten(array: el)
      end
    end

    flattened_nums
  end
end