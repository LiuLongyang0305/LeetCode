//https://leetcode.com/problems/count-special-triplets/
class Solution {
    private let MOD = 1_000_000_007
    func specialTriplets(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        for num in nums {
            counter[num,default: 0] += 1
        }
        var preCounter = [Int:Int]()
        var ans = 0
        for num in nums {
            counter[num,default: 0] -= 1
            if  let v1 = preCounter[2 * num], let v2 = counter[2 * num]  {

                ans += v1 * v2 % MOD
                ans %= MOD
            }
            preCounter[num,default: 0] += 1
        }
        return ans
    }
}
