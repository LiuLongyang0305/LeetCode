//https://leetcode.cn/problems/minimum-operations-to-sort-a-string/
class Solution {
    func minOperations(_ s: String) -> Int {
        let chars = [Character](s)
        let N = chars.count
        //长度为1
        guard N > 1 else {return 0}
        var isSorted = true
        for idx in 1..<N {
            if chars[idx - 1] > chars[idx] {
                isSorted = false
                break
            }
        }
        //已经有序
        if isSorted {return 0}
        //长度为2且无序
        if N == 2 {return -1}
        var mn = chars[0]
        var mx = chars[0]
        for ch in chars {
            mn = min(mn,ch)
            mx = max(mx,ch)
        }
        //如果最小值在s[0],排序s[1...]或者最大值在s[N - 1],排序s[0..<(N - 1)]
        if chars[0] == mn || chars[N - 1] == mx {return 1}
        //如果最小值或者最大值在1..<(N - 1)之中，那么我们可以排序一次把最小值放到最前或者最大值放在最后，然后变成了上一个情况
        for i in stride(from: 1, to: N - 1, by: 1) {
            if chars[i] == mn || chars[i] == mx {
                return 2
            }
        }
        //那么就只有最后一种情况最大之在s[0],最小值在s[N - 1],我们第一步把最大值或者最小值变换到1..<(N - 1)的位置，然后转化为上一个情况
        return 3
    }
}
