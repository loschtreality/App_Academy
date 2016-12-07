require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's Algo:
# 1. Create a top_Level list, nodes, with no deges
# 2. Loop through top_level until empty
#   a. pop node off, push onto sorted
#   b. look at all out edges
#   c. for each, if destination has in_edges, delete edge, else also push onto top level

#
# def topological_sort(vertices)
#   sorted = []
#   top_level = nil # method which takes graph and finds tops: graph.find_tops
#
#   until top_level.empty?
#     current = top_level.pop
#     current.out_edges.each do |oldest_node|
#       sorted << current
#       graph.delete_edge!(current, destination)
#       if def_node.in_edges.empty?
#         top_level.push(oldest_node)
#       end
#     end
#   end
#   sorted
# end


def topological_sort(vertices)
  sorted = []
  top_level = vertices.select { |verts| verts.in_edges.empty? }


  until top_level.empty?
    current = top_level.pop
    current.out_edges.each do |oldest_node|
      sorted << current

    end
  end
  sorted
end
