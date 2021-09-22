 // https://leetcode.com/problems/k-th-smallest-in-lexicographical-order/
class Solution {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        var  pre = 1
        var  num = 1
        while num < k {
            let cnt = getCunout(pre, n)
            if cnt + num > k {
                pre *= 10
                num += 1
            } else {
                pre += 1
                num += cnt
            }
        }
        return pre
    }
    
    private func getCunout(_ pre: Int, _ n: Int) -> Int {
        var cur = pre
        var next = pre + 1
        var count = 0
        while cur <= n {
            count += min(next, n + 1) - cur
            cur *= 10
            next *= 10
        }
        return count
    }
}