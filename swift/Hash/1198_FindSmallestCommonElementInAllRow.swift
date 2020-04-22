// https://leetcode.com/problems/find-smallest-common-element-in-all-rows/
class Solution {
    func smallestCommonElement(_ mat: [[Int]]) -> Int {
        guard !mat.isEmpty && !mat[0].isEmpty else {
            return -1
        }
        let M = mat.count
        let N = mat[0].count
        var counter = [Int:Set<Int>]()
        for r in 0..<M {
            for c in 0..<N {
                if nil == counter[mat[r][c]] {
                    counter[mat[r][c]] = []
                }
                counter[mat[r][c]]?.insert(r)
            }
        }
        var ans = Int.max
        for (key,val) in counter {
            if val.count == M {
                ans = min(ans, key)
            }
        }
        return ans == Int.max ? -1 : ans
    }
}
