require 'helper'

class TestDijkstra < Test::Unit::TestCase
  context "input 1" do
    setup do
      @input = [
        [nil, 2,   1,   nil, nil],
        [2,   nil, 4,   6,   nil],
        [1,   4,   nil, 1,   2],
        [nil, 6,   1,   nil, 3],
        [nil, nil, 2,   3,   nil]
      ]
      @result = Dijkstra.shortest_path(@input, 0)
    end

    should 'return valid distance' do  
      assert_equal 0, @result.distance(0)
      assert_equal 2, @result.distance(1)
      assert_equal 1, @result.distance(2)
      assert_equal 2, @result.distance(3)
      assert_equal 3, @result.distance(4)
      assert_equal nil, @result.distance(222)
    end

    should 'return valid path' do
      assert_equal [0,1], @result.shortest_path(1)
      assert_equal [0,2], @result.shortest_path(2)
      assert_equal [0,2,3], @result.shortest_path(3)
      assert_equal [0,2,4], @result.shortest_path(4)
      assert_equal [], @result.shortest_path(222)
    end
  end # end contex input 1
  
  context "input 2" do
    setup do
      @input = [
      	[nil, 10,   8,    5,    nil],
      	[10,  nil,  nil,  3,    nil],
      	[8,   nil,  nil,  nil,  2],
      	[5,   3,    nil,  nil,  7],
      	[nil, nil,  2,    7,    nil]
      ]
      @result = Dijkstra.shortest_path(@input, 0)
    end
  
    should 'return valid distance' do  
      assert_equal 0, @result.distance(0)
      assert_equal 8, @result.distance(1)
      assert_equal 8, @result.distance(2)
      assert_equal 5, @result.distance(3)
      assert_equal 10, @result.distance(4)
      assert_equal nil, @result.distance(222)
    end
  
    should 'return valid path' do
      assert_equal [0,3,1], @result.shortest_path(1)
      assert_equal [0,2], @result.shortest_path(2)
      assert_equal [0,3], @result.shortest_path(3)
      assert_equal [0,2,4], @result.shortest_path(4)
      assert_equal [], @result.shortest_path(222)
    end
  end # end contex input 2
  
  should 'not allow incorrect graphs' do
    input = [
      [nil, 2, 1, nil, nil],
      [2, nil, 4, 6, nil],
      [1, 4, nil, 1, 2],
      [nil, 6, 1, nil, 3],
      [nil, nil, 2, 3, nil],
      [nil, nil, nil, nil, nil] # extra invalid input
    ]
    assert_raise(ArgumentError){ Dijkstra.shortest_path(input, 0) }
  end
  
end
