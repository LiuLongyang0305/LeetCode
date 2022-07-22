// https://leetcode.com/problems/cat-and-mouse/
class Solution {
    func catMouseGame(_ graph: [[Int]]) -> Int {
        let N = graph.count
        let maxSteps = 5 * N
        var memo = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: N), count: N), count: maxSteps + 5)

        func dfs(_ curStep: Int, _ mouse: Int,_ cat: Int) -> Int {

            guard -1 == memo[curStep][mouse][cat] else {
                return memo[curStep][mouse][cat]
            }
            guard curStep <= maxSteps else {
                memo[curStep][mouse][cat] = 0
                return 0
            }
            guard 0 != mouse  else {
                memo[curStep][mouse][cat] = 1
                return 1
            }
            guard mouse != cat else {
                memo[curStep][mouse][cat] = 2
                return 2
            }
            // mouse turn
            var ans = -1

            if curStep & 1 == 0
            {
                var draw = 0
                for next in graph[mouse] {
                    let t = dfs(curStep + 1, next, cat)
                    guard t != 1 else {
                        ans = 1
                        break
                    }
                    if 0 == t {
                        draw += 1
                    }
                }
                if ans == -1 {
                    ans = draw > 0 ? 0 : 2
                }

            }
            else // cat turn
            {
                var draw = 0
                for next in graph[cat] {
                    guard next != 0 else {continue}
                    let t = dfs(curStep + 1, mouse, next)
                    guard t != 2 else {
                        ans = 2
                        break
                    }
                    if 0 == t {
                        draw += 1
                    }
                }
                if -1 == ans{
                    ans = draw > 0 ? 0 : 1
                }
            }
            memo[curStep][mouse][cat] = ans
            return ans
        }


        return dfs(0, 1, 2)

    }
}
