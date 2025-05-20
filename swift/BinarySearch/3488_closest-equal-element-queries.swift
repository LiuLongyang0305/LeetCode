    // https://leetcode.com/problems/closest-equal-element-queries/
    class Solution {
        func solveQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
            var numToIndices = [Int:[Int]]()
            for i in 0..<nums.count {
                numToIndices[nums[i],default: []].append(i)
            }
            let N = nums.count
            for(num,indices) in numToIndices {
                let t = indices.map { $0 + N}
                numToIndices[num,default: []] += t
            }
            var ans = [Int]()

            for query in queries {
                guard let indices = numToIndices[nums[query]], indices.count > 2 else {
                    ans.append(-1)
                    continue
                }

                var idx = binarySearch(in: indices, query)
                if idx == 0 {
                    idx = binarySearch(in: indices, query + N)
                }
                // print(" \(query)  \(nums[query])  \(idx)   \(indices)")
                ans.append(min( indices[idx] - indices[idx - 1],indices[idx + 1] - indices[idx]))

            }

            return ans
        }


        func binarySearch(in indices: [Int], _ target: Int) -> Int {
            if target == indices[0] {return 0}
            var left = 0
            var right = indices.count - 1

            while left < right {
                let mid = (left + right) >> 1
                if indices[mid] == target {
                    return mid
                } else if indices[mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            return left
        }


    }