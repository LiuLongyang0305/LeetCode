//https://leetcode.com/problems/replace-non-coprime-numbers-in-array/
class Solution {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        var ans = [Int]()
        for num in nums {
            ans.append(num)
            while ans.count > 1 {
                let M = ans.count
                let t = gcd(ans[M - 1], ans[M - 2])
                guard t > 1 else {break}
                ans.append(ans.removeLast() * ans.removeLast() / t)
            }
        }
        return ans
    }
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b,a % b)
    }
}