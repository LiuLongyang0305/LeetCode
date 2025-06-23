//https://leetcode.com/problems/zero-array-transformation-iv/

class Solution {
    func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let N = queries.count
        func caculate(for idx: Int) -> Int {
            if nums[idx] == 0 {
                return 0
            }
            var set = Set<Int>()
            set.insert(nums[idx])
            for i in 0..<N {
                let (l,r,v) = (queries[i][0],queries[i][1],queries[i][2])
                if idx >= l && idx <= r {
                    if set.contains(v) {
                        return i + 1
                    } else {
                        var oldSet = set
                        for num in oldSet {
                            set.insert(num - v)
                        }
                    }
                }

            }
            return -1
        }


        var ans = 0
        for i in 0..<nums.count {
            let sb = caculate(for: i)
            guard sb !=  -1 else {return -1}
            ans = max(ans,sb)
        }
        return ans
    }
}
