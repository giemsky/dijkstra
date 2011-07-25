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
      @graph = Dijkstra::Graph.new(@input)
    end

    should 'return valid distance' do
      2.times do
        assert_equal 0, @graph.distance(0, 0)
        assert_equal 2, @graph.distance(0, 1)
        assert_equal 1, @graph.distance(0, 2)
        assert_equal 2, @graph.distance(0, 3)
        assert_equal 3, @graph.distance(0, 4)
        assert_equal nil, @graph.distance(0, 222)
      end
    end

    should 'return valid path' do
      2.times do
        assert_equal [0,1], @graph.path(0, 1)
        assert_equal [0,2], @graph.path(0, 2)
        assert_equal [0,2,3], @graph.path(0, 3)
        assert_equal [0,2,4], @graph.path(0, 4)
        assert_equal [], @graph.path(0, 222)
      end
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
      @graph = Dijkstra::Graph.new(@input)
    end
  
    should 'return valid distance' do
      2.times do  
        assert_equal 0, @graph.distance(0, 0)
        assert_equal 8, @graph.distance(0, 1)
        assert_equal 8, @graph.distance(0, 2)
        assert_equal 5, @graph.distance(0, 3)
        assert_equal 10, @graph.distance(0, 4)
        assert_equal nil, @graph.distance(0, 222)
      end
    end
  
    should 'return valid path' do
      2.times do
        assert_equal [0,3,1], @graph.path(0, 1)
        assert_equal [0,2], @graph.path(0, 2)
        assert_equal [0,3], @graph.path(0, 3)
        assert_equal [0,2,4], @graph.path(0, 4)
        assert_equal [], @graph.path(0, 222)
      end
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
    assert_raise(ArgumentError){ Dijkstra::Graph.new(input) }
  end
  
end
