// https://leetcode-cn.com/problems/optimize-water-distribution-in-a-village/
class Solution {
    private struct Edge {
        var from: Int
        var to: Int
        var dis: Int
    }
    
    func minCostToSupplyWater(_ n: Int, _ wells: [Int], _ pipes: [[Int]]) -> Int {
        
        var parent = Array<Int>(0...(n + 1))
        var edgesCnt = 0
        
        func find(_ house: Int) -> Int {
           guard parent[house] != house else {
               return house
           }
           var temp = house
           while parent[temp] != temp {
               temp = parent[temp]
           }
           return temp
       }
        
        var edges = [Edge]()
        (0..<wells.count).forEach { edges.append(Edge(from: n + 1, to: $0 + 1, dis: wells[$0]))}
        pipes.forEach {edges.append(Edge(from: $0[0], to: $0[1], dis: $0[2]))}
        edges.sort { (e1, e2) -> Bool in
            e1.dis < e2.dis
        }
        var ans = 0
        for edge in edges {
            guard edgesCnt < n else {
                break
            }
            let p1 = find(edge.from)
            let p2 = find(edge.to)
            guard p1 != p2 else {
                continue
            }
            parent[p1] = p2
            edgesCnt += 1
            ans += edge.dis
        }
        return ans
    }
}
