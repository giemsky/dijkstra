module Dijkstra
  class DistanceFromStart < Struct.new(:vertex, :distance)
    include Comparable

    def <=>(other)
      distance <=> other.distance
    end
  end
end