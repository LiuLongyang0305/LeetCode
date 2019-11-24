//https://leetcode.com/problems/count-servers-that-communicate/
 class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        //行
        var rowsSet = Set<Int>()
        //列
        var colsSet = Set <Int>()
        var servers = Set<[Int]>()
        for i in 0..<grid.count {
            var count  = 0
            for j in 0..<grid[0].count {
                if grid[i][j] == 1{
                    servers.insert([i,j])
                    count += 1
                }
            }
            if count >= 2 {
                rowsSet.insert(i)
            }
        }
        for i in 0..<grid[0].count {
            var count  = 0
            for j in 0..<grid.count {
                if grid[j][i] == 1{
                    count += 1
                    if count == 2 {
                        colsSet.insert(i)
                        break
                    }
                }
            }
        }
        var ans = 0
        for server in servers {
            if colsSet.contains(server[1]) || rowsSet.contains(server[0]) {
                ans += 1
            }
        }
        return ans
    }
 }