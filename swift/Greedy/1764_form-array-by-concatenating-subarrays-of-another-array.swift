// https://leetcode.com/problems/form-array-by-concatenating-subarrays-of-another-array/
class Solution {
    func canChoose(_ groups: [[Int]], _ nums: [Int]) -> Bool {
        let cnt = groups.reduce(0) { $0 + $1.count}
        guard cnt <= nums.count else {
            return false
        }
        let groupCnt = groups.count
        let N = nums.count
        var potentialStartIdx = Array<Array<Int>>(repeating: [], count: groupCnt)
        for idx in 0..<groupCnt {
            
            let length = groups[idx].count
            
            for idx2 in 0...(N - length) {
                if nums[idx2] == groups[idx][0] {
                    var flag = true
                    for t in 1..<length {
                        if nums[idx2 + t] != groups[idx][t] {
                            flag = false
                            break
                        }
                    }
                    if flag {
                        potentialStartIdx[idx].append(idx2)
                    }
                }
            }
            guard !potentialStartIdx[idx].isEmpty else {
                return false
            }
        }
        func dfs(_ fromIdx: Int,_ groupIdx: Int)-> Bool {
            guard groupIdx < groupCnt else {
                return true
            }
            guard fromIdx < N else {
                return false
            }
            for startIdx in potentialStartIdx[groupIdx] {
                if startIdx >= fromIdx {
                    guard !dfs(startIdx + groups[groupIdx].count, groupIdx + 1) else {
                        return true
                    }
                }
            }
            return false
        }
        return dfs(0, 0)
    }
}

