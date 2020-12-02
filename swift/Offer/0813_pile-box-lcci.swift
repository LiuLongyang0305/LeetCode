// https://leetcode-cn.com/problems/pile-box-lcci/
class Solution {
    private struct Box {
        var w:Int
        var d: Int
        var h: Int
    }
    func pileBox(_ box: [[Int]]) -> Int {
        let N = box.count
        guard N > 1 else {
            return box[0][2]
        }
        let boxes = box.map {Box(w: $0[0], d: $0[1], h: $0[2])}
        let sortedBoxes = boxes.sorted { (box1, box2) -> Bool in
            if box1.w == box2.w && box1.d == box2.d{
                return box1.h < box2.h
            }
            if box1.w == box2.w {
                return box1.d < box2.d
            }
            return box1.w < box2.w
        }
        var dp = sortedBoxes.map { $0.h}
        for i in 1..<N {
            var temp = dp[i]
            for j in stride(from: i - 1, through: 0, by: -1) {
                if sortedBoxes[j].w < sortedBoxes[i].w && sortedBoxes[j].d < sortedBoxes[i].d && sortedBoxes[j].h < sortedBoxes[i].h {
                    temp = max(temp, sortedBoxes[i].h + dp[j])
                }
            }
            dp[i] = temp
        }
        return dp.max()!
    }
}
