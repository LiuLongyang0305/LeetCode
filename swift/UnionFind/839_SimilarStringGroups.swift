// https://leetcode.com/problems/similar-string-groups/ 
class Solution {
    class UnionFind {
        var parent: [Int]
        init(_ size: Int) {
            parent = Array<Int>(0..<size)
        }
        func find(_ node: Int) -> Int {
            guard parent[node] != node else {
                return node
            }
            var current = node
            while parent[current] != current {
                current = parent[current]
            }
            var temp = node
            while parent[temp] != current {
                (parent[temp],temp) = (current,parent[temp])
            }
            return current
        }
        func connected(_ node1: Int, _ node2: Int) -> Bool {
            return find(node1) == find(node2)
        }
        func join(_ node1: Int, _ node2: Int)  {
            let p1 = find(node1)
            let p2 = find(node2)
            guard p1 != p2 else {
                return
            }
            parent[p1] = p2
        }
    }
    func numSimilarGroups(_ A: [String]) -> Int {
        var words = Set<String>(A).map {[Character]($0)}
        guard words.count > 1 else {
            return words.count
        }
        let N = words.count
        let wordLength = A[0].count
        func check(first: Int, second: Int) -> Bool {
            var diff = 0
            for index in 0..<wordLength {
                if words[first][index] != words[second][index] {
                    diff += 1
                    if diff > 2 {
                        return false
                    }
                }
            }
            return true
        }
        let uf = UnionFind(A.count)
        for i in 0..<N {
            for j in (i + 1)..<N {
                if check(first: i, second: j){
                    uf.join(i, j)
                }
                
            }
        }
        var ans = 0
        for i in 0..<N {
            if uf.find(i) == i {
                ans += 1
            }
        }
        return ans
    }
 }
 
 

