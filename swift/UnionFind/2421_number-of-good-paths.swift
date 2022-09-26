// https://leetcode.com/problems/number-of-good-paths/
class Solution {

    func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {
        let N = vals.count
        let seq = 0..<N
        var parent = [Int](seq)
        let sortedNodes = seq.sorted { vals[$0] < vals[$1]}

        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }


        var tree = [[Int]](repeating: [Int](), count: N)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }

        var ans = 0

        var i = 0
        while i < N {
            let curNodeVal = vals[sortedNodes[i]]
            var j = i
            while j < N && vals[sortedNodes[j]] == curNodeVal {
                let node = sortedNodes[j]
                for next in tree[node] {
                    if vals[next] <= curNodeVal {
                        parent[find(node)] = find(next)
                    }
                }
                j += 1
            }


            var counter = [Int:Int]()
            for idx in i..<j{
                counter[find(sortedNodes[idx]), default: 0] += 1
            }
            for (_,c) in counter {
                ans += c * (c + 1) / 2
            }
            i = j
        }
        return ans
    }
}