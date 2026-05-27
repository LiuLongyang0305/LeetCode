   //https://leetcode.cn/problems/minimum-operations-to-make-array-modulo-alternating-i/
    class Solution {
        func minOperations(_ nums: [Int], _ k: Int) -> Int {
            var sb = Int.max
            let times = nums.map {$0 / k}
            for x in 0..<k {
                for y in 0..<k{
                    guard x != y else {continue}
                    sb = min(sb,cal(nums, x, y,k))
                }

            }
            return sb
        }

        private func cal(_ nums:[Int], _ x: Int, _ y: Int, _ k: Int) -> Int {

            var sb = 0
            for i in 0..<nums.count {
                //x
                if i & 1 == 0 {
                    let p1 = ((x - nums[i]) % k + k) % k
                    let p2 = ((nums[i] - x) % k + k) % k
                    sb += min(p1,p2)
                } else {
                    //y
                    let p1 = ((y - nums[i]) % k + k) % k
                    let p2 = ((nums[i] - y) % k + k) % k
                    sb += min(p1,p2)
                }
            }
            if sb == 0 {
                print("x = \(x)  y = \(y)")
            }
            return sb
        }
    }
