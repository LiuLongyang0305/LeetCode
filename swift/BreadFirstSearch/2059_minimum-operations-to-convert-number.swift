// https://leetcode.com/problems/minimum-operations-to-convert-number/
class Solution {
    func minimumOperations(_ nums: [Int], _ start: Int, _ goal: Int) -> Int {
        var visited = [Bool](repeating: false, count: 1005)
        var queue = [start]
        var step = 0
        visited[start] = true
        while !queue.isEmpty {
            step += 1
            var nextLevel = [Int]()
            for t in queue {
                for num in nums {
                    for nt in [t + num, t - num, t ^ num] {
                        guard nt != goal else {
                            return step
                        }
                        guard nt >= 0 && nt <= 1000 && !visited[nt] else {
                            continue
                        }
                        visited[nt] = true
                        nextLevel.append(nt)
                    }
                }
            }
            queue = nextLevel
        }
        return -1
    }
}