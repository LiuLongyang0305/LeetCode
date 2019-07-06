//https://leetcode.com/problems/nth-digit/
class Solution {
    func findNthDigit(_ n: Int) -> Int {
        var len = 1
        var count = 9
        var start = 1
        var temp = n
        while temp > len * count {
            temp -= len * count
            len += 1
            count *= 10
            start *= 10
        }
        start += (temp - 1) / len
        return Int(Array<Character>("\(start)")[(temp - 1) % len].asciiValue! - Character("0").asciiValue!)
    }
}