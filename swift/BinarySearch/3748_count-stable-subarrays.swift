    //https://leetcode.cn/problems/count-stable-subarrays/
    let debug = false
    class Solution {
        typealias Pair = (left:Int,right:Int)
        func countStableSubarrays(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
            var notDecreasePairs = [Pair]()
            let N = nums.count
            for idx in 0..<N {
                if let lastPairRight = notDecreasePairs.last?.right, nums[idx] >= nums[lastPairRight] {
                    let M = notDecreasePairs.count
                    notDecreasePairs[M - 1].right = idx

                } else {
                    notDecreasePairs.append((idx,idx))
                }
            }

            // 
            var preffix = [0]
            for pair in notDecreasePairs {
                let M = pair.right - pair.left + 1
                preffix.append(preffix.last! + (M + 1) * M / 2)
            }
            if debug {
                print(notDecreasePairs)
                print(preffix)
            }
            func binarySearchFor(_ idx: Int) -> Int {
                var l = 0
                var r = notDecreasePairs.count - 1
                while l < r {
                    let m = (l + r) >> 1
                    if notDecreasePairs[m].right < idx {
                        l = m + 1
                    } else if notDecreasePairs[m].left > idx {
                        r = m - 1
                    } else {
                        return m
                    }
                }
                return l
            }

            return queries.map { q in
                let l = binarySearchFor(q[0])
                let r = binarySearchFor(q[1])

                if debug {
                    print("\(l) -->  \(r)")         
                }
                guard l != r else {
                    let length = q[1] - q[0] + 1
                    return length * (length + 1) / 2
                }
                
                var total = preffix[r] - preffix[l + 1]
                let M = notDecreasePairs[l].right - q[0] + 1
                total += M * (M + 1) / 2
                let N = q[1] - notDecreasePairs[r].left + 1
                total += N * (N + 1) / 2
                return total
            }
        }
    }
