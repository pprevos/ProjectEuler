# Problem 79: Passcode Derivation
# https://projecteuler.net/problem=79

# Load data
keylog <- readLines("Euler/p079_keylog.txt")
# Remove dumplicates
keylog <- keylog[!duplicated(keylog)]

# Create data frame
first <- substr(keylog, 1, 1)
second <- substr(keylog, 2, 2)
third <- substr(keylog, 3, 3)
                     
# Create graph
library(igraph, quietly=T)
edge.list <- matrix(c(first, first, second, second, third, third), ncol=2)
g <- graph.edgelist(edge.list)
g <- simplify(g)

# Visualise graph
top <- which.min(degree(g, mode="in"))
tree <- layout_as_tree(g, root=top)
par(mar=rep(0, 4))
plot(g, 
     layout=tree, 
     vertex.label.cex=1.5)

# Order of digits
answer <- topo_sort(g)
print(answer)

