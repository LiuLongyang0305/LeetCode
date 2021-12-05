 // https://leetcode.com/problems/minimum-number-of-buckets-required-to-collect-rainwater-from-houses/
class Solution {
    func minimumBuckets(_ street: String) -> Int {
        
        let houses = [Character](street)
        let N = street.count
        var ans = 0
        var i = 0
        while i < N {
            guard houses[i] == "H" else {
                i += 1
                continue
            }
            if i + 1 < N && houses[i + 1] == "." {
                ans += 1
                i += 3
            } else if i - 1 >= 0 && houses[i - 1] == "."{
                ans += 1
                i += 1
            } else {
                return -1
            }
        }
        
        return ans
    }
}