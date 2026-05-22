//https://leetcode.cn/problems/find-the-score-difference-in-a-game/
class Solution {
    func scoreDifference(_ nums: [Int]) -> Int {
        var sb = 0
        var flag = true

        for (idx,num) in nums.enumerated() {
            if num % 2 == 1 {
                flag.toggle()
            }
            if idx % 6 == 5 {
                flag.toggle()
            }
            if flag {
                sb += num
            } else {
                sb -= num
            }
        }
        return sb
    }
}
