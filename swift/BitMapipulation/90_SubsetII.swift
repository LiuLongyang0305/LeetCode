//https://leetcode.com/problems/subsets-ii/
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var existed = Set<[Int]>()
        var  ans = [[Int]]()
        guard nums.count > 0 else {
            return [[Int]]()
        }
        var numsCopy = nums.sorted()
        let length  = Int(exactly: pow(Double(2), Double(nums.count)))!
        for i in 0..<length {
            let ones = getOnesBits(i)
            var temp = [Int]()
            if !ones.isEmpty {
                for j in 0..<ones.count {
                    if  ones[j] == 1 {
                        temp.append(numsCopy[j])
                    }
                }
            }
            if !existed.contains(temp) {
                existed.insert(temp)
                ans.append(temp)
            }
        }
        return ans
    }
    
    private func getOnesBits(_ n: Int) -> [Int] {
        var ans = [Int]()
        var temp = n
        while temp > 0 {
            ans.append(temp & 1)
            temp >>= 1
        }
        return ans
    }
}
