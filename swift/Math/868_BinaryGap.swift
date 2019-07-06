//https://leetcode.com/problems/binary-gap/
class Solution {
    func binaryGap(_ N: Int) -> Int {
        var indices = [Int]()
        var ans = 0
        var i = 0
        var temp = N
        while temp > 0 {
            if temp % 2 == 1 {
                indices.append(i)
            }
            i += 1
            temp >>= 1
        }
        if indices.count < 1 {
            return 0
        }
        for i in 1..<indices.count {
            let temp =  indices[i] - indices[i - 1]
            if temp > ans {
                ans = temp
            }
        }
        return ans
    }
}