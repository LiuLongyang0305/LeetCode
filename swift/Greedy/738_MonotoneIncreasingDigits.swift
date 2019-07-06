//https://leetcode.com/problems/monotone-increasing-digits/
class Solution {
    func monotoneIncreasingDigits(_ N: Int) -> Int {
        if N <= 9 {
            return N
        }
        var originalNumber = [Int]()
        var NCopy = N
        while NCopy > 0 {
            originalNumber.insert(NCopy % 10, at: 0)
            NCopy /= 10
        }
        
        var ans = 0
        var targetIndex = -1
        for i in 1..<originalNumber.count {
            if originalNumber[i] < originalNumber[i - 1] {
                targetIndex = i
                break
            }
        }
        if targetIndex == -1 {
            return N
        }
        var j = targetIndex - 2
        while j >= 0 && originalNumber[j] == originalNumber[j + 1]{
            j -= 1
        }
        j += 1
        originalNumber[j] = originalNumber[j] - 1
        j += 1
        while j < originalNumber.count {
            originalNumber[j] = 9
            j += 1
        }
        for k in 0..<originalNumber.count {
            ans = ans * 10 + originalNumber[k]
        }
        return ans
    }
}