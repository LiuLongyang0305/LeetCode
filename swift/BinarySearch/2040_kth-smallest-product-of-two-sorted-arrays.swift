// https://leetcode.com/problems/kth-smallest-product-of-two-sorted-arrays/
class Solution {
    private typealias DivideResult = (negative:[Int],positive:[Int])
    func kthSmallestProduct(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {

        var dr1 = divideNumbers(nums1)
        var dr2 = divideNumbers(nums2)
        dr1.negative = reverseAndSortArr(of: dr1.negative)
        dr2.negative = reverseAndSortArr(of: dr2.negative)
        var isTargetNegtive = false;
        
        let negtiveProductCnt = dr1.negative.count * dr2.positive.count + dr1.positive.count * dr2.negative.count
        var newK = k
        if k > negtiveProductCnt {
            newK  -= negtiveProductCnt
            isTargetNegtive = false
        } else {
            newK = negtiveProductCnt - k + 1
            (dr2.negative,dr2.positive) = (dr2.positive,dr2.negative)
            isTargetNegtive = true
        }
        var left = 0
        var right = 1_000_000_000_0
        while left < right {
            let mid = left + (right - left) >> 1
            if count(dr1.negative, dr2.negative, mid) + count(dr1.positive, dr2.positive, mid) >= newK {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return isTargetNegtive ? -left : left
        
    }
    private func divideNumbers(_ nums: [Int]) -> DivideResult {
        
        guard nums[0] < 0 else {return ([],nums)}
        guard nums.last! >= 0 else {return (nums,[])}
        var ans: DivideResult = ([],[])
        if let idx = nums.firstIndex(where: { $0 >= 0}) {
            ans.negative = [Int](nums[..<idx])
            ans.positive = [Int](nums[idx...])
        }
        return ans
    }
    
    private func reverseAndSortArr(of arr:  [Int]) -> [Int] {
        var ans = [Int]()
        arr.forEach { ans.insert(-$0, at: 0)}
        return ans
    }
    
    private  func  count(_ first: [Int],_ second: [Int],_ target: Int) -> Int {
        var  ans = 0
        let N  = first.count
        var j = second.count - 1
        for i in 0..<N {
            while j >= 0 && first[i] * second[j] > target {
                j -= 1
            }
            ans += j + 1
        }
        return ans
    }
}