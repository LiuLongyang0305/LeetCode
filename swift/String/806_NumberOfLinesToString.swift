//https://leetcode.com/problems/number-of-lines-to-write-string/ 
class Solution {
    private let aAsciivalue  = Character("a").asciiValue!
    private let maxLineWidth = 100
     func numberOfLines(_ widths: [Int], _ S: String) -> [Int] {
        var ans = [1,0]
        for ch in S {
            let currentWidth = widths[Int(ch.asciiValue! - aAsciivalue)]
            if ans[1] + currentWidth > maxLineWidth {
                ans[0] += 1
                ans[1] =  currentWidth
            } else {
                ans[1] += currentWidth
            }
        }
         return ans
     }
 }