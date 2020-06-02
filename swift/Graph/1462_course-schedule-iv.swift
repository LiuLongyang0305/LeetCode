// https://leetcode.com/problems/course-schedule-iv/
class Solution {
    func checkIfPrerequisite(_ n: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
        var tree = [Int:[Int]]()
        prerequisites.forEach { (edge) in
            if nil == tree[edge[0]] {
                tree[edge[0]]  = []
            }
            tree[edge[0]]?.append(edge[1])
        }
        var visited = Set<Int>()
        var exisitedPairs = Set<[Int]>()
        func dfs(_ node: Int,_  path: inout [Int] ) {
            guard let children = tree[node] else {
                return
            }
            for ch in children {
                if !visited.contains(ch) {
                    visited.insert(ch)
                    for n in path {
                        exisitedPairs.insert([n,ch])
                    }
                    path.append(ch)
                    dfs(ch, &path)
                    path.removeLast()
                }
            }
        }
        
        var ans = [Bool]()
        
        queries.forEach { (query) in
            if exisitedPairs.contains(query) {
                ans.append(true)
            } else if exisitedPairs.contains([query[1],query[0]]) {
                ans.append(false)
            } else {
                visited = [query[0]]
                var path = [query[0]]
                dfs(query[0], &path)
                ans.append(exisitedPairs.contains(query))
            }
        }
        return ans
    }
}

