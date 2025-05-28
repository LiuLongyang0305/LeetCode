//https://leetcode.com/problems/minimize-the-maximum-difference-of-pairs/
class Solution {
    func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
        let sortedNums = nums.sorted()
        let N = sortedNums.count

        func check(_ maxDiff: Int) -> Bool {
            var cnt = 0
            var i = 1
            while i < N {
                if sortedNums[i] - sortedNums[i - 1] <= maxDiff {
                    cnt += 1
                    i += 2
                } else {
                    i += 1
                }
            }
            return cnt >= p
        }


        var l = 0
        var r = 1_000_000_009
        while l < r {
            let mid = (l + r) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l
    }
}


