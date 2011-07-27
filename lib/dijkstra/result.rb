module Dijkstra
  class Result < Struct.new(:predecessors, :best_distances, :start_vertex)
    def shortest_path(target_vertex)
      return [] unless find_distance(target_vertex)
      find_path(target_vertex)
    end

    def distance(target_vertex)
      result = find_distance(target_vertex)
      return unless result
      result.distance
    end
    
    private
    
    def find_path(target_vertex, path = [])
      if target_vertex == start_vertex
        path << start_vertex
        return path.reverse
      end

      find_path(predecessors[target_vertex] || start_vertex, path << target_vertex)
    end
    
    def find_distance(vertex)
      best_distances.find{|sr| sr.vertex == vertex}
    end
  end
end