// https://leetcode.com/problems/divide-chocolate/submissions/
class Solution {
    func maximizeSweetness(_ sweetness: [Int], _ K: Int) -> Int {
        
        var preffix = [0]
        for s in sweetness {
            preffix.append(preffix.last! + s)
        }
        let N = sweetness.count
        
        func check(_ minSweetness: Int) -> Bool {
            var cnt = 0
            var lastIndex = 0
            for idx in 1...N {
                if preffix[idx] - preffix[lastIndex] >= minSweetness {
                    lastIndex = idx
                    cnt += 1
                }
            }
            return cnt >= K + 1
        }
        
        var ans = Int.min
        var low = 1
        var high = 1_000_000_000
        while low < high {
            let mid = low + (high - low) >> 1
            if check(mid) {
                ans = max(ans, mid)
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        if check(low) {
            ans = max(ans, low)
        }
        
        return ans
    }
}
