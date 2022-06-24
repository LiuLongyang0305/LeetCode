// https://leetcode.com/problems/make-the-xor-of-all-segments-equal-to-zero/
class Solution {
    func minChanges(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else {
            return nums.reduce(0, { $0 + ($1 == 0 ? 0 : 1)})
        }
        var groups = [Int](repeating: 0, count: k)
        var counters = [[Int]](repeating: [Int](repeating: 0, count: 1024), count: k)
        var sets = [Set<Int>](repeating: [], count: k)
        let N = nums.count
        for i in 0..<N {
            groups[i % k] += 1
            counters[i % k][nums[i]] += 1
            sets[i % k].insert(nums[i])
        }

        var lastLevelState = [Int](repeating: 0, count: 1024)
        for mask in 0..<1024 {
            lastLevelState[mask] = groups[0] - counters[0][mask]
        }
            ///TLE
//        for i in 1..<k {
//            var newlevelState = [Int](repeating: 2005, count: 1024)
//            for newMask in 0..<1024 {
//                for v in 0..<1024 {
//                    newlevelState[newMask] = min(newlevelState[newMask], lastLevelState[newMask ^ v] + groups[i] - counters[i][v])
//                }
//            }
//            lastLevelState = newlevelState
//        }

        for i in 1..<k {
            var newlevelState = [Int](repeating: 2005, count: 1024)

            var minCost = 2005
            var x = 0
            for j in 0..<1024 {
                if minCost > lastLevelState[j] {
                    x = j
                    minCost = lastLevelState[j]
                }
            }


            for newMask in 0..<1024 {
                //假设当前组最终变为v
                //当在sets[i]当中
                for v in sets[i] {
                    newlevelState[newMask] = min(newlevelState[newMask], lastLevelState[newMask ^ v] + groups[i] - counters[i][v])
                }

                //当v不在sets[i]中，我们发现 groups[i] - counters[i][v] = groups[i] 恒成立，与v无关
                //要使得lastLevelState[newMask ^ v] + groups[i] - counters[i][v]最小，只需保证lastLevelState[newMask ^ v]最小，进而我们只需求得x,使得 lastLevelState[x]最小，进而凑的v = newMask ^ x即可。
                //这样计算所得v，可能也在sets[i]中，不过不影响结果。
                let v = newMask ^ x
                newlevelState[newMask] = min(newlevelState[newMask], lastLevelState[newMask ^ v] + groups[i] - counters[i][v])

            }
            lastLevelState = newlevelState
        }
        return lastLevelState[0]
    }
}