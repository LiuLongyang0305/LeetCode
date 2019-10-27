//https://leetcode.com/problems/gray-code/
class Solution {
    func grayCode(_ n: Int) -> [Int] {
        guard n > 0 else {
            return [0]
        }
        var ans = [Int]()
        ans.append(0)
        ans.append(1)

        guard n > 1 else {
            return ans
        }
        
        var delta = 1
        
        //加0：用十进制表示不用处理
        //加1：用 十进制表示：delta + 原有数字
        for _ in 2...n {
            delta *= 2
            ans.append(contentsOf: ans.reversed().map{$0 + delta})
        }
        
        return ans
    }
}