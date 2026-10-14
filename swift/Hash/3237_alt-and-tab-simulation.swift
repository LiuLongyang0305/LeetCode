    // https://leetcode.cn/problems/alt-and-tab-simulation/
    class Solution {
        func simulationResult(_ windows: [Int], _ queries: [Int]) -> [Int] {
            var sb = windows
            var l = 0
            var set = Set<Int>()
            for q in queries.reversed() {
                if set.contains(q) {continue}
                sb[l] = q
                set.insert(q)
                l += 1
            }
            for w in windows {
                if set.contains(w) {continue}
                sb[l] = w
                l += 1
            }
            return sb
        }
    }
