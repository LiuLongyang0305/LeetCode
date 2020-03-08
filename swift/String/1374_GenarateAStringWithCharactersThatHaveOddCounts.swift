// https://leetcode.com/problems/generate-a-string-with-characters-that-have-odd-counts/ 
class Solution {
    func generateTheString(_ n: Int) -> String {
        return String(repeating: "a", count: n - 1 ) + (n % 2 == 0 ? "b" : "a")
    }
 }