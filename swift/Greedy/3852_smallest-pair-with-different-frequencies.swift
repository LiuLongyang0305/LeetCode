    //https://leetcode.cn/problems/smallest-pair-with-different-frequencies/
    class Solution {
        func minDistinctFreqPair(_ nums: [Int]) -> [Int] {
            var map = [Int:Int]()
            for num in nums {
                map[num,default: 0] += 1
            }
            let existedNums = Set<Int>(nums).sorted()
            guard existedNums.count > 1 else {return [-1,-1]}
            let N = existedNums.count
            for xIdx in stride(from: 0, to: N, by: 1) {
                let cntX = map[existedNums[xIdx]]!
                for yIdx in stride(from: xIdx + 1, to: N, by: 1) {
                    if cntX != map[existedNums[yIdx]]! {
                        return [existedNums[xIdx],existedNums[yIdx]]
                    }
                }
            }
            return [-1,-1]
        }
    }
