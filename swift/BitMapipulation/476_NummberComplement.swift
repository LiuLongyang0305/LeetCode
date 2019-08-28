//https://leetcode.com/problems/number-complement/
class Solution {
    func findComplement(_ num: Int) -> Int {
        var ansArr = [Int]()
        var temp = num
        while temp > 0 {
            let  rel = temp & 1
            ansArr.append(rel == 0 ? 1 : 0)
            temp >>= 1
        }
        var base = 1
        var ans = 0
        for ele in ansArr {
            ans += (base * ele)
            base *= 2
        }
        return ans
    }
}
