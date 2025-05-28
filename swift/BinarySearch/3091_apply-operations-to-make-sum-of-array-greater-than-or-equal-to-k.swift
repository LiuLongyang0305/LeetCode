//https://leetcode.com/problems/apply-operations-to-make-sum-of-array-greater-than-or-equal-to-k/
class Solution {
    func minOperations(_ k: Int) -> Int {

        guard k > 2 else {
            return k - 1
        }

        //贪心先增加再复制
        func check(_ time: Int) -> Bool {

            var addTime = 0
            while  addTime < time {
                let sum = (1 + addTime) * (time - addTime + 1)
                if sum >= k {
                    return true
                }
                addTime += 1
            }


            return false
        }


        var l = 0
        var r = k
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
