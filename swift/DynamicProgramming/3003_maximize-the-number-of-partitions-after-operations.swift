//https://leetcode.cn/problems/maximize-the-number-of-partitions-after-operations/
class Solution {
    func maxPartitionsAfterOperations(_ s: String, _ k: Int) -> Int {
        let nums = s.map { Int($0.asciiValue!) - 97}
        let M = nums.count

        var memo = [Int:Int]()
        func dfs(_ i: Int, _ mask: Int,_ haveChanged: Bool) -> Int {
            guard i < M else {
                return 1
            }
            let key = "\(i)-\(mask)-\(haveChanged ? 1 : 0)".hashValue
            if let sb = memo[key] {return sb}
            var sb = 0
            //当不变化当前字母时
            if mask & (1 << nums[i]) != 0 {
                sb = dfs(i + 1, mask, haveChanged)
            } else {
                if mask.nonzeroBitCount == k {
                    sb = max(sb, 1 + dfs(i + 1, 1 << nums[i], haveChanged))
                } else {
                    sb = max(sb, dfs(i + 1, mask | (1 << nums[i]), haveChanged))
                }
            }

            //改变当前数据
            if !haveChanged {
                for changedValue in 0...25 {
                    if changedValue == nums[i] {continue}
                    if mask & (1 << changedValue) != 0 {
                        sb = max(sb,dfs(i + 1,mask,true))
                    } else {
                        if mask.nonzeroBitCount == k {
                            sb = max(sb, 1 + dfs(i + 1, 1 << changedValue, true))
                        } else {
                            sb = max(sb,dfs(i + 1,mask | (1 << changedValue) , true))
                        }
                    }
                }
            }
            memo[key] = sb
            return sb
        }
        return dfs(0, 0, false)
    }
}
