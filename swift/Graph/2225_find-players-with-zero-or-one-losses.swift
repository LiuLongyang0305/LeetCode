// https://leetcode.com/problems/find-players-with-zero-or-one-losses/
class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var ans = [[Int]](repeating: [], count: 2)
        var map = [Int:(win:Int,lost:Int)]()
        for match in matches {
            let (w,l) = (match[0],match[1])
            map[w,default: (0,0)].win += 1
            map[l,default: (0,0)].lost += 1
        }
        for (p,(_,l)) in map {
            if l == 0 {
                ans[0].append(p)
            } else if l == 1 {
                ans[1].append(p)
            }

        }
        return ans.map { $0.sorted()}
    }
}
