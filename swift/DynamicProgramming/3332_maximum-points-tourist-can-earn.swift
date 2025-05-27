// https://leetcode.cn/problems/maximum-points-tourist-can-earn/
class Solution {
    func maxScore(_ n: Int, _ k: Int, _ stayScore: [[Int]], _ travelScore: [[Int]]) -> Int {

        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: k + 5), count: n + 5)


        func dfs(_ curCity: Int, _ curDay: Int) -> Int {
            guard curDay < k else {return 0}
            if let c = memo[curCity][curDay] {
                return c
            }
            //停留当前
            var ans = stayScore[curDay][curCity] + dfs(curCity, curDay + 1)
            //去往别的城市
            for dest in 0..<n {
                if dest != curCity {
                    ans = max(ans,travelScore[curCity][dest] + dfs(dest, curDay + 1))
                }
            }
            memo[curCity][curDay] = ans
            return ans
        }


        var ans = 0
        for s in 0..<n{
            ans = max(ans,dfs(s, 0))
        }

        return ans
    }
}
