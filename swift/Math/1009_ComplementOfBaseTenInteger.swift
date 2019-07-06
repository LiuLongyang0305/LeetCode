//https://leetcode.com/problems/complement-of-base-10-integer/
class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        if N == 0 {
            return 1
        }
        return Int(pow(2, Double(Int(log2(Double(N))) + 1))) - 1 - N
    }
}
Solution().bitwiseComplement(1)