 // https://leetcode.com/problems/minimum-deletions-to-make-array-divisible/
class Solution {
    func minOperations(_ nums: [Int], _ numsDivide: [Int]) -> Int {
        var numsDivideGCD = numsDivide[0]
        for num in numsDivide {
            numsDivideGCD = gcd(numsDivideGCD, num)
        }
        let sortedNums = nums.sorted()
        var map = [Int:Int]()
        for i in 0..<nums.count {
            if nil == map[sortedNums[i]] {
                map[sortedNums[i]] = i
            }
        }
        var ans = Int.max
        for divide in getDivisors(of: numsDivideGCD) {
            if let i = map[divide] {
                ans = min(ans, i )
            }
        }

        return ans == Int.max ? -1 : ans
    }

    private func gcd(_ a:Int,_ b:Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }


    private func getDivisors(of num: Int) -> [Int] {
        var ans = [Int]()
        var i = 1
        while i <= num / i {
            if num % i == 0 {
                ans.append(i)
                if i != num / i {
                    ans.append(num / i)
                }
            }
            i += 1
        }
        return ans.sorted()
    }
}
