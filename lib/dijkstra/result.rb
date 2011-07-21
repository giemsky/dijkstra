module Dijkstra
  class Result < Struct.new(:predecessors, :best_distances, :start_vertex)
    def path(target_vertex, path = Array.new)   
      if target_vertex == start_vertex
        path << start_vertex
        return path.reverse 
      end

      path(predecessors[target_vertex] || start_vertex, path << target_vertex)
    end
    
    def distance(target_vertex)
      best_distances.find{|sr| sr.vertex_number == target_vertex}.distance
    end
  end
end