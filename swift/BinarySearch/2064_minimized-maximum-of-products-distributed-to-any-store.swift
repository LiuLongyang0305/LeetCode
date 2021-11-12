// https://leetcode.com/problems/minimized-maximum-of-products-distributed-to-any-store/
class Solution {
    func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
        guard n > quantities.count else {
            return quantities.max()!
        }
        let total = quantities.reduce(0) { $0 + $1}
        guard total > n else {
            return 1
        }        
        func check(_ maxQuantity: Int) -> Bool {
            var cnt = 0
            for q in quantities {
                cnt += q / maxQuantity
                if q % maxQuantity > 0 {
                    cnt += 1
                }
            }
            return cnt <= n
        }
        
        
        var left = 0
        var right = quantities.max()!
        
        
        while left < right {
            let mid = (left + right) >> 1
            if check(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}