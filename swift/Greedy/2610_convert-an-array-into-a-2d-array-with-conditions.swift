//https://leetcode.cn/problems/convert-an-array-into-a-2d-array-with-conditions/
class Solution {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var counter = [Int:Int]()
        for num in nums {
            counter[num,default: 0] += 1
        }
        var ans = [[Int]]()
        while !counter.isEmpty {
            var cur = [Int]()
            for (num,c) in counter {
                cur.append(num)
                if c == 1 {
                    counter.removeValue(forKey: num)
                } else {
                    counter[num] = c - 1
                }
            }
            ans.append(cur)
        }

        return ans
    }
}