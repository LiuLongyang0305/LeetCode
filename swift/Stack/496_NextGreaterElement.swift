//https://leetcode.com/problems/next-greater-element-i/
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var ans = [Int]()
        var dic = [Int:Int]()
        var stack = [Int]()
        for num in nums2 {
            while !stack.isEmpty && stack.last! < num {
                dic[stack.removeLast()] = num
            }
            stack.append(num)
        }
        for num in nums1 {
            ans.append(dic[num] == nil ? -1 : dic[num]!)
        }
        return ans
    }
}

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var  stack = [Int]()
        var dic = [Int:Int]()
        for num in nums2 {
            while !stack.isEmpty && stack.last! < num {
                dic[stack.removeLast()] = num
            }
            stack.append(num)
        }
        return nums1.map { dic[$0] ?? -1}
    }
}

