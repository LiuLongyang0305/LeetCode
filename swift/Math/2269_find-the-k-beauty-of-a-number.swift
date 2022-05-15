// https://leetcode.com/problems/find-the-k-beauty-of-a-number/
class Solution {
    func divisorSubstrings(_ num: Int, _ k: Int) -> Int {
        let numstr = "\(num)"
        var ans = 0
        
        var curStr = ""
        for ch in numstr {
            curStr.append(ch)
            if curStr.count > k {
                curStr.removeFirst()
            }
            if curStr.count == k  {
                let n = Int(curStr)!
                if n != 0 && num % n == 0 {
                    // print(curStr)
                    ans += 1
                }
            }

        }
        return ans
    }
}