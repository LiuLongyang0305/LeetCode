//https://leetcode.com/problems/game-of-nim/
class Solution {
    func nimGame(_ piles: [Int]) -> Bool {

        var memo = [Int:Bool]()

        func dfs(_ curPiles: [Int]) -> Bool {
            var sortedCurPiles = curPiles.sorted()
            guard let idx = sortedCurPiles.firstIndex(where: { $0 > 0}) else {
                return false
            }
            if idx > 0 {
                sortedCurPiles.removeFirst(idx)
            }

            let M = sortedCurPiles.count
            guard M > 1 else {
                return true
            }
            let key = sortedCurPiles.hashValue
            if let v = memo[key] {
                return v
            }
            var ans = false
            for i in 0..<M {
                var cur = sortedCurPiles
                for _ in 1...sortedCurPiles[i] {
                    cur[i] -= 1
                    ans = !dfs(cur)
                    guard !ans else {
                        break
                    }
                }
                guard !ans else {break}
            }

            memo[key] = ans

            return ans
        }


        return dfs(piles)
    }
}