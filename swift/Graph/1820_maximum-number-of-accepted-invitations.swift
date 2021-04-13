//https://leetcode-cn.com/problems/maximum-number-of-accepted-invitations/
class Solution {
    func maximumInvitations(_ grid: [[Int]]) -> Int {
        let boy = grid.count
        let girl = grid[0].count
        var mapGirlToBoy = Array<Int>(repeating: -1, count: girl)
        var visited = Array<Bool>()
        func match(_ curBoy: Int) -> Bool {
            for curGirl in 0..<girl {
                if grid[curBoy][curGirl] == 1 && !visited[curGirl] {
                    visited[curGirl] = true
                    if mapGirlToBoy[curGirl] == -1 || match(mapGirlToBoy[curGirl]){
                        mapGirlToBoy[curGirl] = curBoy
                        return true
                    }
                }
            }
            return false
        }
        var cnt = 0
        for curBoy in 0..<boy {
            visited = Array<Bool>(repeating: false, count: girl)
            if match(curBoy) {
                cnt += 1
            }
        }
        return cnt
    }
}
