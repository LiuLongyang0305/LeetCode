// https://leetcode.com/problems/simplified-fractions/
class Solution {
    func simplifiedFractions(_ n: Int) -> [String] {
        guard n > 1 else {
            return []
        }
        
        var ans = [String]()
        for i in 1..<n {
            for j in (i + 1)...n {
                if i == 1 || check(i, j) {
                    ans.append("\(i)/\(j)")
                }
            }
        }
        return ans
    }
    private func gcd(_ i: Int, _ j: Int) -> Int {
        if i % j == 0 {
            return j
        }
        return gcd(j,i % j)
    }
    private func check(_ i: Int, _ j: Int) -> Bool {
        return gcd(i,j) == 1
    }
}