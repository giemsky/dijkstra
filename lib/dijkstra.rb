require 'dijkstra/distance_from_start'
require 'dijkstra/result'

module Dijkstra
  INFINITY = 1 << 64

  #
  # distance_matrix - Graph Array as edge distances, nil for no connections
  # start_vertex - vertex number for which calculation should be made
  #
  # example input:
  #
  # nil   2    1   nil  nil
  #  2   nil   4    6   nil
  #  1    4   nil   1    2
  # nil   6    1   nil   3
  # nil  nil   2    3   nil   
  #
  def self.shortest_path(distance_matrix, start_vertex)
    valid_graph?(distance_matrix)
    
    predecessors = Array.new
    distances_from_start = calculate_distances_from_start(distance_matrix, start_vertex)
    
    # store for best distances from start calculated for each vertex
    best_distances = distances_from_start.dup
    best_distances << DistanceFromStart.new(start_vertex, 0)

    until distances_from_start.empty? do
       smallest_distance_from_start = distances_from_start.min
       distances_from_start.delete(smallest_distance_from_start)
       
       # iterating through smallest_distance_from_start vertex's neighbours
       distance_matrix[smallest_distance_from_start.vertex_number].each_with_index do |distance, vertex_number|
         next if distance.nil?
         
         neighbour_distance_from_start = best_distances.find{|sr| sr.vertex_number == vertex_number}
         possible_new_distance = smallest_distance_from_start.distance + distance

         # store new distance and predecessor if new connection is better that stored
         if possible_new_distance < neighbour_distance_from_start.distance
           neighbour_distance_from_start.distance = possible_new_distance
           predecessors[vertex_number] = smallest_distance_from_start.vertex_number
         end
       end
    end

    Result.new(predecessors, best_distances, start_vertex)
  end
  
  def self.calculate_distances_from_start(distance_matrix, start_vertex)
    distances_from_start = Array.new
    
    distance_matrix[start_vertex].each_with_index do |distance, number|
      next if number == start_vertex
      distances_from_start << DistanceFromStart.new(number, distance || INFINITY)
    end
    
    distances_from_start
  end
  
  def self.valid_graph?(input)
    # check if rows and columns size matches
    raise ArgumentError, "Different rows and columns size" if input.inject(0){|sum, row| sum + row.size} % input.size != 0
  end
end