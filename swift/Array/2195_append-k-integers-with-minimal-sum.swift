// https://leetcode.com/problems/append-k-integers-with-minimal-sum/
class Solution {
    func minimalKSum(_ nums: [Int], _ k: Int) -> Int {
        let newNums = [0] + nums.sorted()
        let N = newNums.count
        var need = k
        var ans = 0
        var idx = 1
        
        while idx < N {
            if newNums[idx] - newNums[idx - 1] > 1 {
                let left = newNums[idx - 1] + 1
                var right = newNums[idx] - 1
                var cnt = right - left + 1
                cnt = min(cnt, need)
                right = left + cnt - 1
                need -= cnt
                ans += cnt * (left + right) / 2
                guard need > 0 else {return ans}
            }
            idx += 1
        }
        
        if need > 0 {
            let left = newNums.last! + 1
            let right = left + need - 1
            ans += need * (left + right) / 2
        }
        
        return ans
    }
}