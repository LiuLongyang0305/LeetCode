// https://leetcode.com/problems/count-nice-pairs-in-an-array/
class Solution {
    private let MOD = 1_000_000_007
    func countNicePairs(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        for num in nums {
            counter[num - Int(String("\(num)".reversed()))!, default: 0] += 1
        }
        var cnt = 0
        for (_,c) in counter {
            guard c > 1 else {
                continue
            }
            cnt += ((c - 1) * c / 2) % MOD
            cnt %= MOD
        }
        return cnt
    }
}