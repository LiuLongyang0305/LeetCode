//https://leetcode.com/problems/network-recovery-pathways/
class Solution {
    private  typealias Pair = (to: Int,cost:Int)
    func findMaxPathScore(_ edges: [[Int]], _ online: [Bool], _ k: Int) -> Int {
        
        guard edges.count > 0 else {return -1}
        let N = online.count
        
        var graph = [[Pair]](repeating: [], count: N + 5)
        
        for e in edges {
            if online[e[1]] && online[e[0]] {
                graph[e[0]].append((e[1],e[2]))
            }
        }
        
        func check(_ mid: Int) -> Bool {
            
            var flag = false
            
            func dfs( _ cur: Int, _ remainCost: Int) {
                if cur == N - 1 {
                    flag = true
                    return
                }
                for (n,c) in  graph[cur] {
                    if !flag && c >= mid && remainCost - c >= 0 {
                        dfs(n, remainCost - c)
                    }
                }
            }
            
            dfs(0,k)
            
            return flag
        }
        
        if !check(-1) {
//            print("*****")
            return -1
        }
        
        var l = 0
        var r = 1_000_000_000
        while l < r {
            let mid = (l + r + 1) >> 1
            if check(mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }
}
