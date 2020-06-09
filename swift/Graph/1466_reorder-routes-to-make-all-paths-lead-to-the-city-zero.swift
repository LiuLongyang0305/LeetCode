// https://leetcode.com/problems/reorder-routes-to-make-all-paths-lead-to-the-city-zero/
class Solution {
    func minReorder1(_ n: Int, _ connections: [[Int]]) -> Int {
        var graph = [Int:[Int]]()
        var reversedGraph = [Int:[Int]]()
        
        connections.forEach { (connection) in
            graph[connection[0],default: [Int]()].append(connection[1])
            reversedGraph[connection[1],default: [Int]()].append(connection[0])
        }
        var queue = [Int]()
        queue.append(0)
        var visited = Array<Bool>(repeating: false, count: n)
        visited[0] = true
        
        var cnt = 0
        while !queue.isEmpty {
            var nextLevel = [Int]()
            for node in queue {
                if let children = graph[node] {
                    for ch in children {
                        if !visited[ch] {
                            visited[ch] = true
                            nextLevel.append(ch)
                            cnt += 1
                        }
                    }
                }
                if let children = reversedGraph[node] {
                    for ch in children {
                        if !visited[ch] {
                            visited[ch] = true
                            nextLevel.append(ch)
                        }
                    }
                }
            }
            queue = nextLevel
        }
        return cnt
    }
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var set = Set<Int>()
        var res = 0
        set.insert(0)
        
        for c in connections {
            if !set.contains(c[1]) { res += 1; set.insert(c[1])}
            set.insert(c[0])
        }
    return res
}
}


