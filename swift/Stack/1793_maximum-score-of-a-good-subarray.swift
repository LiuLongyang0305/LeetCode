// https://leetcode.com/problems/maximum-score-of-a-good-subarray/
class Solution1 {
    private typealias Pair = (left:Int,right:Int)
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        var sortedPairs:[Pair] = [(-2,-2),(100005,10005)]
        let N = nums.count
        let sortedIndices = (0..<N).sorted { nums[$0] > nums[$1]}
        var ans = 0
        func insert(_ pair: Pair) -> Pair {
            var left = 0
            var right = sortedPairs.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedPairs[mid].left > pair.right {
                    right = mid
                } else {
                    left = mid + 1
                }
            }

            let preIdx = left - 1
            //可以合并
            if pair.left == sortedPairs[preIdx].right + 1 && pair.right == sortedPairs[left].left - 1 {
                sortedPairs[preIdx].right = sortedPairs[left].right
                sortedPairs.remove(at: left)
                return sortedPairs[preIdx]
            }
            if pair.left == sortedPairs[preIdx].right + 1 {
                sortedPairs[preIdx].right = pair.right
                return sortedPairs[preIdx]
            }
            if pair.right == sortedPairs[left].left - 1 {
                sortedPairs[left].left = pair.left
                return sortedPairs[left]
            }
            sortedPairs.insert(pair, at: left)
            return pair
        }


        for idx in sortedIndices {
            let curMin = nums[idx]
            let pair = insert((idx,idx))
            if k >= pair.left && k <= pair.right {
                ans = max(ans, curMin * (pair.right - pair.left + 1))
            }
        }
        return ans
    }
}



class Solution {
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let N = nums.count
        var left = [Int](repeating: -1, count: N)
        var right = [Int](repeating: N, count: N)
        var stack = [Int]()
        for i in 0..<N {
            while let idx = stack.last, nums[idx] >= nums[i] {
                stack.removeLast()
            }
            left[i] = stack.last ?? -1
            stack.append(i)
        }

        stack = []
        for i in stride(from: N - 1, through: 0, by: -1) {
            while let idx = stack.last, nums[idx] >= nums[i] {
                stack.removeLast()
            }
            right[i] = stack.last ?? N
            stack.append(i)
        }
        var ans = nums[k]
        for i in 0..<N {
            if left[i] < k && right[i] > k {
                ans = max(ans, nums[i] * (right[i] - left[i] - 1))
            }
        }
        return ans
    }
}
