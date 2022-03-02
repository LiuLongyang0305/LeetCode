//  https://leetcode.com/problems/tiling-a-rectangle-with-the-fewest-squares/
class Solution {
    func tilingRectangle(_ n: Int, _ m: Int) -> Int {
        
        guard n != m else {return 1}

        var memo = [Int:Int]()
        
        func dfs(_ state: [[Bool]]) -> Int {
            
 
            let key = state.hashValue
            if let v = memo[key] {
                return v
            }
            
            var sr = -1
            var sc = -1
            
            for i in 0..<n {
                if let j = state[i].firstIndex(of: false) {
                    sr = i
                    sc = j
                    break
                }
            }
            
            guard sr != -1 && sc != -1 else {
                memo[key] = 0
                return 0
            }
            
            
            var ans = Int.max
            
            
            var length = 1
            while length <= 13 {
                let maxR = sr + length - 1
                let maxC = sc + length - 1
                guard maxR < n && maxC < m else {break}
                var flag = false
                for r in sr...maxR {
                    for c in sc...maxC {
                       flag =  flag || state[r][c]
                    }
                }
                guard !flag else {break}
                var newState = state
                for r in sr...maxR {
                    for c in sc...maxC {
                        newState[r][c] = true
                    }
                }
                ans = min(ans, 1 + dfs(newState))
                length += 1
            }
            memo[key] = ans
            return ans
        }
        return dfs([[Bool]](repeating: [Bool](repeating: false, count: m), count: n))
    }
}