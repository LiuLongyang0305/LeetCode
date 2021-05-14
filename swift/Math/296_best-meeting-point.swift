// https://leetcode.com/problems/best-meeting-point/
class Solution {
    func minTotalDistance(_ grid: [[Int]]) -> Int {
        let M = grid.count
        let N = grid.first?.count ?? 0
        guard M > 0 && N > 0 else {
            return 0
        }
        var xPos = [Int]()
        var yPos = [Int]()
        for r in 0..<M {
            for c in 0..<N {
                guard grid[r][c] == 1 else {
                    continue
                }
                xPos.append(r)
                yPos.append(c)
            }
        }
        let peoPleCnt = xPos.count
        xPos.sort()
        yPos.sort()
        let half = peoPleCnt >> 1
        let dis = xPos[half] + yPos[half]
        var ans = 0
        for i in 0..<peoPleCnt {
            ans += i < half ?  dis - xPos[i] - yPos[i] : xPos[i] + yPos[i] - dis
        }
        return ans
    }
}