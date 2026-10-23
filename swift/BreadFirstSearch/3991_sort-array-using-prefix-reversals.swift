   // https://leetcode.cn/problems/sort-array-using-prefix-reversals/
    class Solution {
        func sortArray(_ nums: [Int], _ pre: [Int]) -> Int {
            let target = [Int](0..<nums.count)
            guard target != nums else {return 0}
            let M = pre.count
            var visited = Set<[Int]>()
            visited.insert(nums)
            var queue = [nums]
            var ans = 0
            while !queue.isEmpty {
                ans += 1
                var newLevel = [[Int]]()
                for cur in queue {
                    for pl in pre {
                        let new = [Int](cur.prefix(pl).reversed()) + [Int](cur.dropFirst(pl))
                        if new == target {
                            return ans
                        }
                        if !visited.contains(new) {
                            visited.insert(new)
                            newLevel.append(new)
                        }
                    }
                }
                queue = newLevel
            }
            return -1
        }
    }
