// https://leetcode.com/problems/find-the-winner-of-an-array-game/
class Solution {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        guard arr.count > k else {
            return arr.max()!
        }
        var curMaxEle = arr[0]
        var cnt = 0
        for i in 1..<arr.count {
            if arr[i] < curMaxEle {
                cnt += 1
                if cnt >= k {
                    return curMaxEle
                }
            } else {
                cnt = 1
                curMaxEle = arr[i]
                if cnt >= k {
                    return curMaxEle
                }
            }
        }
        return arr.max()!
    }
}