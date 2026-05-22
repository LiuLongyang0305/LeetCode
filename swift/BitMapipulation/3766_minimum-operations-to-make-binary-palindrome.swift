    //https://leetcode.cn/problems/minimum-operations-to-make-binary-palindrome/

var binaryPalindromeNums = [Int]()
var str = [Character](String(5000,radix: 2))
let M = str.count
for i in 0..<M {
    if str[i] == "0" {
        str[i] = "1"
    }
}
let maxNum = Int(String(str),radix: 2)!
// print(maxNum)
for i in 0...maxNum {
    let str = String(i,radix: 2)
    var reversedStr = String(str.reversed())
    if reversedStr.count > 1 {
        while let f = reversedStr.first, f == "0" {
            reversedStr.removeFirst()
        }
    }
    if str == reversedStr {
        binaryPalindromeNums.append(i)
    }
}

// print(binaryPalindromeNums)
class Solution {
    func minOperations(_ nums: [Int]) -> [Int] {
        let M = nums.count
        let sortedIdx = (0..<M).sorted { nums[$0] < nums[$1]}
        var sb = [Int](repeating: -1, count: M)
        var i = 0
        for idx in sortedIdx {
            while binaryPalindromeNums[i] < nums[idx] {
                i += 1
            }

                sb[idx] = min(i <= 0 ? Int.max : (nums[idx] - binaryPalindromeNums[i - 1]), binaryPalindromeNums[i] - nums[idx])

        }
        return sb
    }
}
