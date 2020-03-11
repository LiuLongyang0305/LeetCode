// https://leetcode.com/problems/jump-game-ii/
class Solution1 {
    func jump(_ nums: [Int]) -> Int {
        let N = nums.count
       guard N > 1 else {
            return 0
        }
        var visited = Array<Bool>(repeating: false, count: N)
        var queue = Array<Int>()
        queue.append(0)
        visited[0] = true
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            var nextLevel = [Int]()
            for index in queue {
                if index + nums[index] >= N - 1 {
                    return depth
                }
                let minIndex = max(0, index - nums[index])
                let maxIndex = min(index + nums[index], N - 1)
                for index in minIndex...maxIndex where !visited[index]{
                    visited[index] = true
                    nextLevel.append(index)
                }
                queue = nextLevel
            }
        }
        return depth
    }
 }

