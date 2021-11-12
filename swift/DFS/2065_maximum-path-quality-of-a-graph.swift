//  https://leetcode.com/problems/maximum-path-quality-of-a-graph/
class Solution {
    private typealias Edge = (end:Int,weight:Int)
    private var values = [Int]()
    private var graph = [[Edge]]()
    private var maxTime = -1
    private var ans = 0
    private var visited = [Int]()
    func maximalPathQuality(_ values: [Int], _ edges: [[Int]], _ maxTime: Int) -> Int {
        self.values = values
        self.graph = [[Edge]](repeating: [Edge](), count: values.count)
        edges.forEach { e in
            graph[e[0]].append((e[1],e[2]))
            graph[e[1]].append((e[0],e[2]))
        }
        self.maxTime = maxTime
        self.visited = [Int](repeating: 0, count: values.count)
        dfs(0, 0,0)
        return ans
    }
    
    func dfs(_ curNode: Int, _ curTime: Int,_ curVal: Int) {
        guard curTime <= maxTime else {return}
        var newVal = curVal
        if visited[curNode] == 0 {
            newVal += self.values[curNode]
        }
        self.visited[curNode] += 1
        if(0 == curNode) {
            self.ans = max(self.ans,newVal)
        }
        for edge in self.graph[curNode] {
            dfs(edge.end, curTime + edge.weight, newVal)
        }
        self.visited[curNode] -= 1
    }
}