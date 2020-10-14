// https://leetcode.com/problems/split-array-with-equal-sum/
class Solution {
    func splitArray(_ nums: [Int]) -> Bool {
        guard nums.count >= 7 else {
            return false
        }
        let N = nums.count
        var preffixMap = [Int:[Int]]()
        var suffixMap = [Int:[Int]]()
        var preffix = [Int]()
        var suffix = [Int]()

        for i in 0..<N {
            let pre = (preffix.last ?? 0) + nums[i]
            let suf = (suffix.first ?? 0) + nums[N - i - 1]
            preffix.append(pre)
            suffix.insert(suf, at: 0)
            preffixMap[pre,default: [] ].append(i)
            suffixMap[suf,default: [] ].append(N - 1 - i)
        }
        
        func check(_ left: Int, _ right: Int, _ sum: Int) -> Bool {
            guard right - left + 1 >= 3 else {
                return false
            }
            for skipIdx in (left + 1)...(right - 1) {
                if preffix[skipIdx - 1] - preffix[left - 1] == sum && suffix[skipIdx + 1] - suffix[right + 1] == sum {
                    return true
                }
            }
            return false
        }
        
        for (sum,left) in preffixMap {
            if let right = suffixMap[sum] {
                for l in left {
                    for r in right {
                        if check(l + 2, r - 2,sum) {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
}
