require 'helper'

class TestDijkstra < Test::Unit::TestCase
  should 'return valid result' do
    input = [
      [nil, 2,   1,   nil, nil],
      [2,   nil, 4,   6,   nil],
      [1,   4,   nil, 1,   2],
      [nil, 6,   1,   nil, 3],
      [nil, nil, 2,   3,   nil]
    ]
    result = Dijkstra.shortest_path(input, 0)
    
    # test distances
    assert_equal 0, result.distance(0)
    assert_equal 2, result.distance(1)
    assert_equal 1, result.distance(2)
    assert_equal 2, result.distance(3)
    assert_equal 3, result.distance(4)
    
    # test shortest path
    assert_equal [0,1], result.path(1)
    assert_equal [0,2], result.path(2)
    assert_equal [0,2,3], result.path(3)
    assert_equal [0,2,4], result.path(4)
  end
end
