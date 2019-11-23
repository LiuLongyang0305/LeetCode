//https://leetcode.com/problems/prime-palindrome/
extension Int {
    var toArr: [Int] {
        var ans = [Int]()
        var temp = self
        while temp > 0 {
            ans.insert(temp % 10, at: 0)
            temp /= 10
        }
        return ans
    }
    var isPalindrome: Bool {
        return toArr.reversed() == toArr
    }
    var isPrimeNumber: Bool {
        if self < 2 {
            return true
        }
        let squreRoot = Int(sqrt(Double(self)))
        var i = 2
        while i <= squreRoot {
            if self % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
}

extension Array where Element == Int {
    var toNumber: Int {
        var ans = 0
        for i in 0..<count {
            ans = ans * 10 + self[i]
        }
        return ans
    }
}
func createPalindromeNumbers(_ count: Int) -> [Int] {
    var ans: [Int] = [11,33,77,99]
    guard count != 2 else {
        return ans
    }
    var last: [[Int]] = ans.map{$0.toArr}
    ans.insert(7, at: 0)
    ans.insert(5, at: 0)
    ans.insert(3, at: 0)
    ans.insert(2, at: 0)
    
    for _ in 3...count {
        let length = last.count
        for _ in 0..<length {
            let arr = last.removeFirst()
            if arr.count % 2 == 0 {
                for i in 0...9 {
                    var temp = arr
                    temp.insert(i, at: arr.count >> 1)
                    last.append(temp)
                }
            }  else {
                var temp = arr
                let num = arr[arr.count >> 1]
                temp.insert(num, at: arr.count >> 1)
                last.append(temp)
            }
        }
        ans.append(contentsOf: last.map({ $0.toNumber}))
    }
    ans =  ans.filter{$0.isPrimeNumber}
    ans.sort()
    return ans
}
let arr = createPalindromeNumbers(8)
class Solution {
    func primePalindrome(_ N: Int) -> Int {
        for num in arr {
            if num >= N {
                return num
            }
        }
        return 100030001
    }
}

