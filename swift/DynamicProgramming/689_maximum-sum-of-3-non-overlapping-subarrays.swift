//https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays/
class Solution {
    private typealias InfoNode = (left:Int,right:Int,sum:Int)
    func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
        let N = nums.count
        var preffixOfK = [InfoNode]()
        var curSum = 0
        
        for i in 0..<N {
            curSum += nums[i]
            if i >= k {
                curSum -= nums[i - k]
            }
            if i >= k - 1 {
                preffixOfK.append((i - k + 1,i,curSum))
            }
        }
        
        let sortedNodes = preffixOfK.sorted { first, second in
            if first.sum == second.sum {
                return first.left < second.left
            }
            return first.sum > second.sum
        }
        let M = sortedNodes.count
        
        var ans = [Int]()
        var sum = 0
        var nodeIdx = 0
        var leftNode: InfoNode? = nil
        var rightIdx = 0
        
        
        for middleNode in preffixOfK {
            
            while rightIdx < M && sortedNodes[rightIdx].left <= middleNode.right {
                rightIdx += 1
            }
            
            guard rightIdx < M else {break}

            while preffixOfK[nodeIdx].right < middleNode.left {
                if preffixOfK[nodeIdx].sum > (leftNode?.sum ?? 0) {
                    leftNode = preffixOfK[nodeIdx]
                }
                nodeIdx += 1
            }
            guard let lt = leftNode else {continue}
            let rt = sortedNodes[rightIdx]
            let temp = lt.sum + middleNode.sum + rt.sum
            if temp > sum {
                sum = temp
                ans = [lt.left,middleNode.left,rt.left]
            }
        }
        return ans
    }
}