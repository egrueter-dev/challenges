require 'pry'
class BoundingBox
  def initialize(left,bottom,width,height)
    @left = left
    @bottom = bottom
    @width = width
    @height = height

  end
  def contains_point?(x,y)
    if (x >= left && x <= right && y >= bottom && y <= top)
     return true
    else
     return false
    end
  end

  def left
   @left
  end

  def right
   @right = @left + @width
  end

  def bottom
   @bottom
  end

  def top
    @bottom + @height
  end

  def width
   @width
  end

  def height
   @height
  end
end
