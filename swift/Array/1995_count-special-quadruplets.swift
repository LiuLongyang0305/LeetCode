// https://leetcode.com/problems/count-special-quadruplets/
class Solution {
    func countQuadruplets(_ nums: [Int]) -> Int {
        let N = nums.count
        var a = 0
        var ans = 0
        while a < N - 3 {
            var b = a + 1
            while b < N - 2 {
                var c = b + 1
                while c < N - 1 {
                    let sum = nums[a] + nums[b] + nums[c]
                    var d = c + 1
                    while d < N {
                        if nums[d] == sum {
                            ans += 1
                        }
                        d += 1
                    }
                    c += 1
                }
                b += 1
            }
            a += 1
        }
        return ans
    }
}