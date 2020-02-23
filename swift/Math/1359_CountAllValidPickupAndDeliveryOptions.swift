//https://leetcode.com/problems/count-all-valid-pickup-and-delivery-options/
//相当于在已经排好序的正常序列中插入两个位置，并先放置 pn 再放置 dn
 class Solution {
    
    private let MOD = 1_000_000_007
    
    func countOrders(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        
        var ans = 1
        
        for num in 2...n {
            let lastSequenceCount = (num - 1) << 1
            ans = ans *  (lastSequenceCount + 1)  * (lastSequenceCount + 2) >> 1 % MOD
        }
        return ans
    }
 }