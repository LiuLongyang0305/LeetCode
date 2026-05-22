    //https://leetcode.cn/problems/first-element-with-unique-frequency/
    class Solution {
        func firstUniqueFreq(_ nums: [Int]) -> Int {
            var fre = [Int:Int]()
            for num in nums {
                fre[num,default: 0] += 1
            }
            var cntForFre = [Int:Int]()
            for (_,c) in fre {
                cntForFre[c,default: 0] += 1
            }
            for num in nums {
                if cntForFre[fre[num]!]! == 1 {
                    return num
                }
            }
            return -1
        }
    }
