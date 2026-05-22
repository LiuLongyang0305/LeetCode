// https://leetcode.cn/problems/maximize-points-after-choosing-k-tasks/
    class Solution {
        func maxPoints(_ technique1: [Int], _ technique2: [Int], _ k: Int) -> Int {
            let M = technique1.count
            let sortedIndices = (0..<M).sorted { i,j in
                technique2[j] - technique1[j]  > technique2[i] - technique1[i]
            }

//            print(sortedIndices)
            var sb = 0

            for i in 0..<M {
//                print(sb)
                if i < k {
                    sb += technique1[sortedIndices[i]]
                } else {
                    sb += max(technique1[sortedIndices[i]],technique2[sortedIndices[i]])
                }
            }

            return sb
        }
    }
