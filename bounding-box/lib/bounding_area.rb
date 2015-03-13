require 'pry'
class BoundingArea
  attr_accessor :bounding_boxes
  def initialize(bounding_boxes)
    @bounding_boxes = []
    @bounding_boxes << bounding_boxes
    @bounding_boxes
  end

  def contains_point?(x,y)
    @pointx = x
    @pointy = y

    if @pointx == 0.0 && @pointy == 0.0
      return false
    else
     @bounding_boxes[0].each do |box|
        if box.contains_point?(@pointx,@pointy)
          return true
        else
          return false
        end
      end
    end
  end
end
