require 'rspec'

class PolyTreeNode

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def dfs(target_value)
        return self if value == target_value
        children.each do |child| 
            result = child.dfs(target_value)
            return result if result
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        while queue.length > 0 do
            current_node = queue.shift
            return current_node if current_node.value == target_value
            current_node.children.each { |child| queue.push(child) }
        end
        nil
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(node)
        if node == nil
            @parent.children.delete(self)
            @parent = nil
        elsif @parent == nil
            @parent = node
            node.children << self
        else
            @parent.remove_child(self)
            @parent = node
            @parent.children << self
        end
    end

    def add_child(child)
        unless @children.include?(child)
            child.parent = self
        end
    end

    def remove_child(child)
        if !@children.include?(child)
            raise "not a child of the node"
        else
            @children.delete(child)
            child.parent = nil
        end
        
    end

    def inspect
        @value.inspect
    end

end