//https://leetcode.com/problems/minimum-number-of-operations-to-make-array-empty/
class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        for num in nums {
            counter[num,default: 0] += 1
        }
        var ans = 0
        for (_,c) in counter {
            guard c > 1 else  {return -1}
            if c == 2 {
                ans += 1
            } else  {
                switch (c % 3){
                    case 0:
                        ans += c / 3
                    case 1:
                        ans += c / 3 + 1
                    case 2:
                        ans += c / 3 + 1
                    default:
                        break
                }
            }
        }
        return ans
    }
}
