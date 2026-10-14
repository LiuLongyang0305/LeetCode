    // https://leetcode.cn/problems/rearrange-array-by-removing-distinct-values/
    class Solution {
        func rearrangeArray(_ nums: [Int]) -> [Int] {
            var counter = [Int](repeating: 0, count: 105)
            for num in nums {
                counter[num] += 1
            }
            var sb = [Int]()
            let maxLevel = counter.max()!
            for _ in 0..<maxLevel {
                for i in 0...100 {
                    if counter[i] > 0 {
                        sb.append(i)
                        counter[i] -= 1
                    }
                }
            }
            return sb
        }
    }
