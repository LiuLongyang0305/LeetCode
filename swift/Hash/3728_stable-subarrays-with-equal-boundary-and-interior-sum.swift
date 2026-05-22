
    // https://leetcode.cn/problems/stable-subarrays-with-equal-boundary-and-interior-sum/
    class Solution {
        private struct Key: Hashable {
            var cl: Int
            var slPlus1: Int
        }
        func countStableSubarrays(_ capacity: [Int]) -> Int {
            var cnt = [Key:Int]()
            var sum = capacity[0]
            var sb = 0
            for r in 1..<capacity.count {
                let key1 = Key(cl: capacity[r], slPlus1: sum)
                sb += (cnt[key1] ?? 0)
                let key2 = Key(cl: capacity[r - 1], slPlus1: sum + capacity[r - 1])
                cnt[key2,default: 0] += 1
                sum += capacity[r]
            }
            return sb
        }
    }
