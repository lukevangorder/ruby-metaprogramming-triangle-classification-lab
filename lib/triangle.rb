class Triangle
  def initialize(a,b,c)
    @values = [a,b,c]
    @values.sort!
    @ab = @values[0]+@values[1]
    @bc = @values[1]+@values[2]
    @ca = @values[2]+@values[0]
    if a <= 0.0
      raise TriangleError
    elsif
      @values.each do |value|
        if value == nil
          raise TriangleError
        elsif value < 0
          raise TriangleError
        end
      end
    # else
    #   @values.each do |value|
    #     if value + @values[@values.find_index(value)-1] <= @values[@values.find_index(value)+1]
    #       raise TriangleError
    #     end
    #   end
    end
  end

  def kind
    # @values.each do |value|
    #   @twovalues = @value[@value.index(value)]+@value[@value.index(value)-1]
    #   if @value.index(value) == @index[-1]
    #     @third = @value[0]
    #   else
    #     @third = @value[@value.index(value)+1]
    #   end
    #   if @twovalues <= @third
    #     raise TriangleError
    #   end
    # end
    if @ab <= @values[2] || @bc <= @values[0]
      raise TriangleError
    elsif @ca <= @values[1]
      raise TriangleError
    end
    if @values[0] == @values[1] && @values[1] == @values[2]
      return :equilateral
    elsif @values[0] == @values[1] && @values[1] != @values[2]
      return :isosceles
    elsif @values[0] != @values[1] && @values[1] == @values[2]
      return :isosceles
    elsif @values[0] == @values[2] && @values[1] != @values[2]
      return :isosceles
    else
      return :scalene
    end
  end
  
  class TriangleError < StandardError
    puts "Invalid Triangle Sides"
  end
end
