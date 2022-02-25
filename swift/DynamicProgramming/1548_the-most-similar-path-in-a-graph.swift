// https://leetcode-cn.com/problems/the-most-similar-path-in-a-graph/
class Solution {
    private typealias Info = (diff:Int, path:[Int])
    func mostSimilar(_ n: Int, _ roads: [[Int]], _ names: [String], _ targetPath: [String]) -> [Int] {
        let M = targetPath.count
        var graph = [[Int]](repeating: [], count: n)
        for road in roads {
            graph[road[0]].append(road[1])
            graph[road[1]].append(road[0])
        }
        
        
        var memo = [[Info?]](repeating: [Info?](repeating: nil, count: M + 2), count: n + 2)
        
        
        
        func dfs(_ curCity: Int, _ targetIdx: Int) -> Info {
            
            guard targetIdx < M else {return (0,[])}
            
            if let info = memo[curCity][targetIdx] {
                return info
            }
            
            var ans: Info = (Int.max,[])
            
            for next in graph[curCity] {
                let t = dfs(next, targetIdx + 1)
                if t.diff < ans.diff {
                    ans = t
                }
            }
            ans.diff += (names[curCity] == targetPath[targetIdx] ? 0 : 1)
            ans.path.insert(curCity, at: 0)
            memo[curCity][targetIdx] = ans
            return ans
        }
        

        var ans: Info = (Int.max,[])
        for startCity in 0..<n {

            let t = dfs(startCity, 0)
            if t.diff < ans.diff {
                ans = t
            }
        }
        return ans.path
    }
}