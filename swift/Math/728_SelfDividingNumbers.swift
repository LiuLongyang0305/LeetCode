//https://leetcode.com/problems/self-dividing-numbers/
class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var ans = [Int]()
        for i in left...right {
            if i < 10 {
                ans.append(i)
                continue
            }
            var j = i
            var isSelfDividingNumber = true
            while j > 0 {
                let temp = j % 10
                if temp == 0 || i % temp != 0 {
                    isSelfDividingNumber = false
                    break
                }
                j /= 10
            }
            if isSelfDividingNumber {
                ans.append(i)
            }
        }
        return ans
    }
}
