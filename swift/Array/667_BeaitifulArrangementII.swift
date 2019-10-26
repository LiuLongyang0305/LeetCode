//https://leetcode.com/problems/beautiful-arrangement-ii/
class Solution {
    func constructArray(_ n: Int, _ k: Int) -> [Int] {
        guard k != 1 else {
            return Array<Int>(1...n)
        }
        var ans = Array<Int>(repeating: 0, count: n)
        var i = 0
        var temp = 1
        var numK = k + 1
        
        while i <= k {
            ans[i] = temp
            temp += 1
            i += 2
        }
        i = 1
        while i  <= k {
            ans[i] = numK
            numK -= 1
            i += 2
        }
        for j in (k + 1)..<n {
            ans[j] = j + 1
        }
        return ans
    }
}