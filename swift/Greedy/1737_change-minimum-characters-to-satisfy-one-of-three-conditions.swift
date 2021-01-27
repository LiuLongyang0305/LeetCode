// https://leetcode.com/problems/change-minimum-characters-to-satisfy-one-of-three-conditions/
class Solution {
    func minCharacters(_ a: String, _ b: String) -> Int {
        var aCounter = Array<Int>(repeating: 0, count: 26)
        var bCounter = Array<Int>(repeating: 0, count: 26)
        let M = a.count
        let N = b.count
        for ch in a {
            aCounter[Int(ch.asciiValue! - 97)] += 1
        }
        for ch in b {
            bCounter[Int(ch.asciiValue! - 97)] += 1
        }
        var ans = Int.max
        var preffixA = 0
        var preffixB = 0
        for i in 0..<26 {
            preffixA += aCounter[i]
            preffixB += bCounter[i]
            
            ans = min(ans, M + N - (aCounter[i] + bCounter[i]))
            if i != 25 {
                ans = min(ans, M - preffixA + preffixB,N - preffixB + preffixA)
            }
        }
        return ans
    }
}
