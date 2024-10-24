//https://leetcode.com/problems/subsets/
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        guard nums.count > 0 else {
            ans.append([Int]())
            return ans
        }
        let length  = Int(exactly: pow(Double(2), Double(nums.count)))!
        for i in 0..<length {
            let ones = getOnesBits(i)
            var temp = [Int]()
            if !ones.isEmpty {
                for j in 0..<ones.count {
                    if  ones[j] == 1 {
                        temp.append(nums[j])
                    }
                }
            }
            ans.append(temp)
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


class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        let N = nums.count
        let T = (1 << N) - 1

         func getNums(by mask: Int) -> [Int] {
            var ans = [Int]()
             for i in 0..<N {
                 if (1 << i) & mask != 0 {
                     ans.append(nums[i])
                 }

             }
             return ans
        }


        var ans = [[Int]]()

        for i in 0...T {
            ans.append(getNums(by: i))
        }

        return ans
    }
}