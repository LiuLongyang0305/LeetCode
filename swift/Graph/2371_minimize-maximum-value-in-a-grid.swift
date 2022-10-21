// https://leetcode.com/problems/minimize-maximum-value-in-a-grid/
class Solution {
    func minScore(_ grid: [[Int]]) -> [[Int]] {
        let M = grid.count
        let N = grid[0].count
        guard M * N > 1 else {return [[1]]}
        var tree = [Int:Set<Int>]()
        if N > 1 {
            for r in 0..<M {
                let sortedC = (0..<N).sorted { grid[r][$0] < grid[r][$1]}
                var idx = 0
                while idx < N - 1 {
                    tree[((r << 30) | sortedC[idx]),default: []].insert((r << 30) | sortedC[idx + 1])
                    idx += 1
                }
            }
        }

        if M > 1 {
            for c in 0..<N {
                let sortedR = (0..<M).sorted { grid[$0][c] < grid[$1][c]}
                var idx = 0
                while idx < M - 1 {
                    tree[(sortedR[idx] << 30) | c,default: []].insert((sortedR[idx + 1] << 30) | c)
                    idx += 1
                }
            }
        }


        var inDegree = [Int:Int]()
        for (p,children) in tree {
            for child in children {
                inDegree[child,default: 0] += 1
            }
        }

        var ans = [[Int]](repeating: [Int](repeating: 0, count: N), count: M)
        var level = 0
        var queue = [Int]()
        for r in 0..<M {
            for c in 0..<N {
                let key = (r << 30) | c
                if nil == inDegree[key] {
                    queue.append(key)
                }
            }
        }

        while !queue.isEmpty {
            level += 1
            var newQueue = [Int]()
            for key in queue {
                let r = (key >> 30) & 0xffff
                let c = key & 0xffff
                ans[r][c] = level
                guard let children = tree[key] else {continue}
                for child in children {
                    inDegree[child,default: 0] -= 1
                    if let c = inDegree[child],c == 0 {
                        newQueue.append(child)
                    }
                }

            }
            queue = newQueue
        }
        return ans
    }
}
