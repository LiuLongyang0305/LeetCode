//https://leetcode.cn/problems/lexicographically-maximum-mex-array/
class Solution {
    func maximumMEX(_ nums: [Int]) -> [Int] {
        let N = nums.count
        var pos = [[Int]](repeating: [], count: N + 1)
        for i in 0..<N {
            let x = nums[i]
            if x < N {
                pos[x].append(i)
            }
        }
        var sb = [Int]()
        var i = 0
        while i < N {
            let start = i
            var mex = 0
            while true {
                while let f = pos[mex].first, f < start {
                    pos[mex].removeFirst()
                }
                if pos[mex].isEmpty {
                    break
                }
                i = max(i,pos[mex].first!)
                mex += 1
            }
            sb.append(mex)
            i += 1
        }
        return sb
    }
}
