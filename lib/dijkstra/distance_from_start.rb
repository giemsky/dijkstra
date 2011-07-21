module Dijkstra
  class DistanceFromStart < Struct.new(:vertex_number, :distance)
    include Comparable

    def <=>(other)
      distance <=> other.distance
    end
  end
end