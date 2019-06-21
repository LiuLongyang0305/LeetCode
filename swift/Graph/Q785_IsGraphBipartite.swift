// https://leetcode.com/problems/is-graph-bipartite/

class Solution {
    
    enum Colour: Int {
        case red = 1
        case green = 2
        case blank = -1
    }
    
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let size = graph.count
        var nodeColurs = Array<Colour>(repeating: .blank, count: size)
        var coloured = Set<Int>()
        var result = true
        
        func dfs(currentNode: Int, color: Colour) {
            if !result {
                return
            }
            if nodeColurs[currentNode] == .blank {
                coloured.insert(currentNode)
                nodeColurs[currentNode] = color
            }
            let targetColor: Colour = color == .red ? .green : .red
            for node in graph[currentNode] {
                if !coloured.contains(node) {
                    dfs(currentNode: node, color: targetColor)
                } else {
                    if nodeColurs[node] != targetColor {
                        result = false
                    }
                }
            }
        }
        
        // for case1
        for i in 0..<size {
            if !result {
                return false
            }
            if !coloured.contains(i)  {
                dfs(currentNode: i, color: .red)
            }
        }
        
        return result
    }
}
//case 1
var  graph = [[2,4],[2,3,4],[0,1],[1],[0,1],[7],[9],[5],[],[6],[12,14],[],[10],[],[10],[19],[18],[],[16],[15],[23],[23],[],[20,21],[],[],[27],[26],[],[],[34],[33,34],[],[31],[30,31],[38,39],[37,38,39],[36],[35,36],[35,36],[43],[],[],[40],[],[49],[47,48,49],[46,48,49],[46,47,49],[45,46,47,48]]