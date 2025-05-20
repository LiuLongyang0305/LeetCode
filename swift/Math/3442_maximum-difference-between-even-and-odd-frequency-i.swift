//https://leetcode.cn/problems/maximum-difference-between-even-and-odd-frequency-i/
class Solution {
    func maxDifference(_ s: String) -> Int {
        var counter = [Character:Int]()
        for ch  in s {
            counter[ch,default: 0] += 1
        }
        var maxOdd = 1
        var minEven = 10000
        for (_,cnt) in counter {
            if cnt & 1 == 0 {
                minEven = min(cnt,minEven)
            } else {
                maxOdd = max(maxOdd,cnt)
            }
        }
        return maxOdd - minEven
    }
}