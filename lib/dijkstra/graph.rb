module Dijkstra
  class Graph
    #
    # distance_matrix - Graph Array as edge distances, nil for no connections
    #
    # example input:
    #
    # nil   2    1   nil  nil
    #  2   nil   4    6   nil
    #  1    4   nil   1    2
    # nil   6    1   nil   3
    # nil  nil   2    3   nil
    #
    def initialize(distance_matrix)
      @distance_matrix = distance_matrix
      valid?
      @results = {}
    end
    
    def distance(start_vertex, end_vertex)
      calculation_result(start_vertex).distance(end_vertex)
    end
    
    def path(start_vertex, end_vertex)
      calculation_result(start_vertex).shortest_path(end_vertex)
    end
    
    private
    
    def valid?
      raise ArgumentError, "Only Array allowed" unless @distance_matrix.is_a?(Array)
      # check if rows and columns size matches
      unless @distance_matrix.size == @distance_matrix.transpose.size
        raise ArgumentError, "Different rows and columns size" 
      end
    end
    
    def calculation_result(start_vertex)
      @results[start_vertex] ||= Calculator.new(@distance_matrix, start_vertex).calculate
    end

  end
end