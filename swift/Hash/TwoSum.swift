//https://leetcode.com/problems/two-sum/
class Q1_Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var dic = Dictionary<Int,Int>()
        for i in 0..<nums.count {
            if let lastIndex = dic[target - nums[i]] {
                result.append(contentsOf: [lastIndex,i])
                return result
            } else {
                dic[nums[i]] = i
            }
        }
        return result
    }
}