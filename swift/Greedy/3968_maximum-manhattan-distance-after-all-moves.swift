// https://leetcode.cn/problems/maximum-manhattan-distance-after-all-moves/
class Solution {
    func maxDistance(_ moves: String) -> Int {
        var counter = [Character:Int]()
        for m in moves {
            counter[m,default: 0] += 1
        }
        let x = (counter["D"] ?? 0) - (counter["U"] ?? 0)
        let y = (counter["L"] ?? 0) - (counter["R"] ?? 0)
        return  abs(x) + abs(y) + (counter["_"] ?? 0)
    }
}
