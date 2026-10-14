//https://leetcode.cn/problems/minimum-queen-moves-to-reach-target/
class Solution {
    func minQueenMoves(_ source: [Int], _ target: [Int]) -> Int {
        let (sx,sy) = (source[0],source[1])
        let (tx,ty) = (target[0],target[1])
        if sx == tx && sy == ty {return 0}
        if sx == tx || sy == ty {
            return 1
        }
        let dx = sx - tx
        let dy = sy - ty
        if abs(dx) == abs(dy) {return 1}
        return 2
    }
}
