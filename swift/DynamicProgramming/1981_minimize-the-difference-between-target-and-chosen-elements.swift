// https://leetcode.com/problems/minimize-the-difference-between-target-and-chosen-elements/
class Solution {
    func minimizeTheDifference(_ mat: [[Int]], _ target: Int) -> Int {
        var last = Set<Int>()
        last.insert(0)
        for row in mat {
            var new = Set<Int>()
            var minLargerThanTargetNum: Int = Int.max
            for num in row {
                for preSum in last {
                    let curSum = preSum + num
                    if curSum <= target {
                        new.insert(curSum)
                        continue
                    }
                    if curSum < minLargerThanTargetNum {
                        minLargerThanTargetNum = curSum
                    }
                }
            }
            if minLargerThanTargetNum != Int.max  {
                new.insert(minLargerThanTargetNum)
            }
            last = new
        }
        var ans = Int.max
        for num in last {
            ans = min(ans, abs(num - target))
        }
        return ans
    }
}