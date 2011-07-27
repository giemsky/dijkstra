module Dijkstra
  class Calculator
    INFINITY = 1/0.0
    
    def initialize(distance_matrix, start_vertex)
      @distance_matrix = distance_matrix
      @start_vertex    = start_vertex
    end
    
    def calculate
      @result ||= shortest_path
    end
    
    private
    
    def shortest_path
      @predecessors = []
      @distances = calculate_distances_from_start

      # store for best distances from start calculated for each vertex
      @best_distances = calculate_distances_from_start
      @best_distances << DistanceFromStart.new(@start_vertex, 0)

      process_closest_vertex until @distances.empty?

      Result.new(@predecessors, @best_distances, @start_vertex)
    end
    
    def process_closest_vertex
      smallest_distance = @distances.min
      @distances.delete(smallest_distance)

      # iterating through smallest distance vertex's neighbours
      @distance_matrix[smallest_distance.vertex].each_with_index do |distance, vertex|
        next if distance.nil?
        find_shorter_path(distance, vertex, smallest_distance)
      end
    end
    
    def find_shorter_path(distance, vertex, smallest_distance)
      neighbour_distance = @best_distances.find{|sr| sr.vertex == vertex}
      possible_new_distance = smallest_distance.distance + distance

      # store new distance and predecessor if new connection is better that stored
      if possible_new_distance < neighbour_distance.distance
        neighbour_distance.distance = possible_new_distance
        @predecessors[vertex] = smallest_distance.vertex
      end
    end

    def calculate_distances_from_start
      distances_from_start = []

      @distance_matrix[@start_vertex].each_with_index do |distance, number|
        next if number == @start_vertex
        distances_from_start << DistanceFromStart.new(number, distance || INFINITY)
      end

      distances_from_start
    end
  end
end