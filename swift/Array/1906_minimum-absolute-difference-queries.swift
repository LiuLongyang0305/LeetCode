// https://leetcode.com/problems/minimum-absolute-difference-queries/
class Solution {
    func minDifference(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        var preffix = [[Int]]()
        var curCounter = Array<Int>(repeating: 0, count: 101)
        preffix.append(curCounter)
        for num in nums {
            curCounter[num] += 1
            preffix.append(curCounter)
        }
        for query in queries {
            let leftCounter = preffix[query[0]]
            let rightCounter = preffix[query[1] + 1]
            var temp = Int.max
            var last = -1
            for idx in 0...100 {
                if rightCounter[idx] - leftCounter[idx] > 0 {
                    if last != -1 {
                        temp = min(temp, idx - last)
                    }
                    last = idx
                }
            }
            ans.append(temp == Int.max ? -1 : temp)
        }
        return ans
    }
}