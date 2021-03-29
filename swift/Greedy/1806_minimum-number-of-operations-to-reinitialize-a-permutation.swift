// https://leetcode.com/problems/minimum-number-of-operations-to-reinitialize-a-permutation/
class Solution1 {
    func reinitializePermutation(_ n: Int) -> Int {
        var cnt = 0
        var idx = 1
        let half = n >> 1
        while cnt == 0 || idx > 1 {
            if idx < half {
                idx = idx * 2
            } else {
                idx = (idx - half) * 2 + 1
            }
            cnt += 1
        }
        return cnt
    }
}

class Solution {
    func reinitializePermutation(_ n: Int) -> Int {
        var cnt = 0
        var pre = Array<Int>(0..<n)
        let target = pre
        var arr = Array<Int>(repeating: 0, count: n)
        let half = n / 2
        while true {
            // print(pre)
            cnt += 1
            for i in 0..<n {
                if i % 2 ==  0 {
                    arr[i] = pre[i / 2]
                } else {
                    arr[i] = pre[half + (i -  1) / 2]
                }
            }
            
            if arr ==  target {
                return cnt
            }
            pre = arr
        }
        return cnt
    }
}