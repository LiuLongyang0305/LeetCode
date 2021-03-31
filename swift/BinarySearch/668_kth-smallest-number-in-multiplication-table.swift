// https://leetcode.com/problems/kth-smallest-number-in-multiplication-table/
class Solution {
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        var low = 0
        var high = m * n
        while low < high {
            let mid = low + (high - low) >> 1
            if enough(mid, m, n, k) {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return  low
    }
    
    private func enough(_ x: Int, _ m: Int, _ n: Int, _ k: Int) -> Bool {
        var cnt = 0
        for i in 1...m {
            cnt += min(x / i, n)
        }
        return cnt >= k
    }
}

