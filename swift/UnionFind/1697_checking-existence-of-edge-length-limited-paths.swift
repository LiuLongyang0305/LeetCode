// https://leetcode.com/problems/checking-existence-of-edge-length-limited-paths/
class Solution {
    private var parent = Array<Int>()
    private var sortedEdgesIndices = [Int]()
    private var edgeList = [[Int]]()
    func distanceLimitedPathsExist(_ n: Int, _ edgeList: [[Int]], _ queries: [[Int]]) -> [Bool] {
        
        self.parent = Array<Int>(0..<n)
        self.sortedEdgesIndices = (0..<edgeList.count).sorted(by: { (idx0, idx1) -> Bool in
            edgeList[idx0][2] <= edgeList[idx1][2]
        })
        self.edgeList = edgeList
        
        let N = queries.count
        var ans = Array<Bool>(repeating: false, count: N)
        let sortedQuerisIndices = (0..<N).sorted { (idx0, idx1) -> Bool in
            queries[idx0][2] <= queries[idx1][2]
        }
        for idx in sortedQuerisIndices {
            addEdge(queries[idx][2])
            ans[idx] = connected(queries[idx][1], queries[idx][0])
        }
        return ans
    }
    
    private func find(_ x: Int) -> Int {
        guard parent[x] != x else {
            return x
        }
        var temp = x
        while temp != parent[temp] {
            temp = parent[temp]
        }
        parent[x] = temp
        return temp
    }
    
    private func addEdge(_ limit: Int) {
        while !sortedEdgesIndices.isEmpty && edgeList[sortedEdgesIndices[0]][2] < limit{
            let edge = edgeList[sortedEdgesIndices.removeFirst()]
            let f1 = find(edge[0])
            let f2 = find(edge[1])
            guard f1 != f2 else {
                continue
            }
            if f1 < f2 {
                parent[f2] = f1
            } else {
                parent[f1] = f2
            }
        }
    }
    private func connected(_ first: Int, _ second: Int) -> Bool {
        return find(first) == find(second)
    }
}