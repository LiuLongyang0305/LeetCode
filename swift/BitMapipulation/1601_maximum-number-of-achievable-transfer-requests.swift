//https://leetcode.com/problems/maximum-number-of-achievable-transfer-requests/
class Solution {
    func maximumRequests(_ n: Int, _ requests: [[Int]]) -> Int {
        let N = requests.count
        let maxState = (1 << N) - 1
        
        var ans = 0
        var state = 1
        
        
        func check(_ state: Int) -> Int {
            var cnt = 0
            var delta = [Int](repeating: 0, count: n)
            
            for idx in 0..<N {
                if state & (1 << idx) != 0 {
                    cnt += 1
                    delta[requests[idx][0]] -= 1
                    delta[requests[idx][1]] += 1
                }
            }
            
            if let _ = delta.firstIndex(where: { $0 != 0}) {
                return -1
            }
            
            
            return cnt
        }
        
        
        while state <= maxState {
            ans = max(ans,check(state))
            state += 1
        }
        return ans
    }
}
