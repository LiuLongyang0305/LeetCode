// https://leetcode.com/problems/number-of-different-subsequences-gcds/
class Solution {
    func countDifferentSubsequenceGCDs(_ nums: [Int]) -> Int {
        var cnt = 0
        let max = nums.max()!
        var numbers = Array<Bool>(repeating: false, count: max + 1)
        for num in nums {
            numbers[num] = true
        }
        for i in 1...max {
            guard !numbers[i] else {
                cnt += 1
                continue
            }
            var gcd = 0
            var b = i
            while b <= max  {
                if numbers[b] {
                    gcd =  __gcd(gcd, b)
                }
                b += i
            }
            if gcd == i {
                cnt += 1
            }
        }
        return cnt
    }
    
    private func __gcd(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else {
            return a
        }
        return a % b == 0 ? b : __gcd(b, a % b)
    }
}

