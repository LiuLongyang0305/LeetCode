//https://leetcode.com/problems/minimum-height-trees/
class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 2 else {
            return Array<Int>(0..<n)
        }
        var graph = Dictionary<Int,Set<Int>>()
        for edge in edges {
            let first = edge[0]
            let second = edge[1]
            if nil == graph[first] {
                graph[first] = Set<Int>()
            }
            graph[first]?.insert(second)
            if nil == graph[second] {
                graph[second] = Set<Int>()
            }
            graph[second]?.insert(first)
        }
        
        while graph.count > 2 {
            let leafs = graph.filter { (arg0) -> Bool in
                
                let (_, value) = arg0
                return value.count == 1
            }
            
            for (root,value) in leafs {
                let parent = value[value.startIndex]
                graph[parent]?.remove(root)
                graph.removeValue(forKey: root)
            }
        }
        
        return Array<Int>(graph.keys)
    }
}