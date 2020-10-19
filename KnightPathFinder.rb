require_relative "PolyTreeNode.rb"

# Finds a knight's path between a start and end position on
# an 8x8 chessboard
class KnightPathFinder

    def self.valid_pos(pos)
        board_size = 8
        row, col = pos
        if row >= 0 && col >= 0 &&
            row < board_size && col < board_size
            
            return true
        end
        false
    end

    def self.valid_moves(pos)
        deltas = [ 
            [-2, 1],
            [-1, 2],
            [1, 2],
            [2, 1],
            [-2, -1],
            [-1, -2],
            [2, -1],
            [1, -2]
        ]
        
        all_moves = deltas.map do |delta|
            d_row, d_col = delta
            row, col = pos
            [(row + d_row), (col + d_col)]
        end

        all_moves.select { |move| self.valid_pos(move) }
    end

    def initialize(start_position)
        unless KnightPathFinder.valid_pos(start_position)
            raise "invalid start position" 
        end

        @start_pos = start_position
        @considered_positions = [start_position]
        @root = PolyTreeNode.new(start_position)
    end

    def find_path(end_pos)
        raise "invalid end position" unless KnightPathFinder.valid_pos(end_pos)
    end

    def build_move_tree
    end

    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_moves.select { |move| !@considered_positions.include?(move) }
    end

end

#Tests
#p KnightPathFinder.valid_pos([3, 4])
#p KnightPathFinder.valid_pos([0, 0])
#p KnightPathFinder.valid_pos([7, 7])
#p KnightPathFinder.valid_pos([-3, 4])
#p KnightPathFinder.valid_pos([0, -1])
#p KnightPathFinder.valid_pos([8, 2])
#p KnightPathFinder.valid_pos([7, 8])
#puts
#p KnightPathFinder.valid_moves([0,0])
#p KnightPathFinder.valid_moves([2, 2])
#p KnightPathFinder.valid_moves([1, 2])
#
#kpf = KnightPathFinder.new([0,0])
#p kpf.new_move_positions([1,2])