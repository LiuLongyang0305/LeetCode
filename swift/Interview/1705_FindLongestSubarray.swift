// https://leetcode-cn.com/problems/find-longest-subarray-lcci/
class Solution {
    private typealias Answer  = (length: Int,start:Int?)
    func findLongestSubarray(_ array: [String]) -> [String] {
        var ans: Answer = (Int.min,nil)
        var sum = 0
        var map = [Int:Int]()
        map[0] = -1
        for index in 0..<array.count {
            sum += Int(array[index]) == nil ? -1 : 1
            if let firstIndexOfSum = map[sum] {
                let length  = index  - firstIndexOfSum
                if  length > ans.length {
                    ans.length = length
                    ans.start = firstIndexOfSum
                }
            } else {
                map[sum] = index
            }
        }
        guard let firstIndex = ans.start else {
            return []
        }
        return [String](array[(firstIndex + 1)...(firstIndex + ans.length)])
    }
}
