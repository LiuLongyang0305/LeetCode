//https://leetcode.com/problems/binary-watch/
let hours = [0: [0], 1: [1, 2, 4, 8], 2: [3, 5, 6, 9, 10], 3: [7, 11]]
let minutes = [5: [31, 47, 55, 59], 1: [1, 2, 4, 8, 16, 32], 0: [0], 2: [3, 5, 6, 9, 10, 12, 17, 18, 20, 24, 33, 34, 36, 40, 48], 3: [7, 11, 13, 14, 19, 21, 22, 25, 26, 28, 35, 37, 38, 41, 42, 44, 49, 50, 52, 56], 4: [15, 23, 27, 29, 30, 39, 43, 45, 46, 51, 53, 54, 57, 58]]

class Solution {
    func readBinaryWatch(_ num: Int) -> [String] {
        var ans = [String]()
        let maxLimit = min(3, num)
        for i in 0...maxLimit {
            for hr in hours[i]! {
                let minutesOnes = num - i
                if minutesOnes >= 0 && minutesOnes <= 5 {
                    for min in  minutes[minutesOnes]! {
                        ans.append("\(hr):"  + (min < 10 ? "0" : "") + "\(min)")
                    }
                }
            }
        }
        return ans
    }
}