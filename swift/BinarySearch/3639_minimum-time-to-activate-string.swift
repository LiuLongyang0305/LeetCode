//https://leetcode.com/problems/minimum-time-to-activate-string/
class Solution {
    func minTime(_ s: String, _ order: [Int], _ k: Int) -> Int {
        let N = s.count
        guard N * (N + 1) / 2 >= k else {return -1}
        let chars = [Character](s)
        func check(_ time: Int) -> Bool {
            let replacedIndices = Set<Int>(order[...time])
            var ans = 0
            var last: Int? = nil
            for i in 0..<N {
                if replacedIndices.contains(i) {
                    last = i
                } 
                if let l = last {
                    ans += l + 1
                }
            }
            return ans >= k 
        }

        var l = 0
        var r = N  - 1
        while l < r {
            let mid = (l + r) >> 1
            if check(mid) {
                r = mid
            } else {
                l = mid + 1
            }
        }
        return l 
    }
}
