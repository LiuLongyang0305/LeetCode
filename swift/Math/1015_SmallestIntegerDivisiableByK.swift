//https://leetcode.com/problems/smallest-integer-divisible-by-k/
class Solution {
    func smallestRepunitDivByK(_ K: Int) -> Int {
        guard !(K % 2 == 0  || K % 5  == 0)  else {
            return -1
        }
        guard K != 1 else {
            return  1
        }
        var count = 1
        var temp  = 1
        while temp != 0 {
            temp = (temp * 10 + 1) % K
            count += 1
        }
        return  count
    }
}