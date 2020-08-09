// https://leetcode.com/problems/find-kth-bit-in-nth-binary-string/
class Solution {
    func findKthBit(_ n: Int, _ k: Int) -> Character {
        var last = [false]
        guard k > 1 else {
            return "0"
        }
        var cur = [Bool]()
        for _ in 2...n {
            cur = last
            cur.append(true)
            cur.append(contentsOf: last.map({!$0}).reversed())
            guard k > cur.count else {
                break
            }
            last = cur
        }
        return cur[k - 1] ? "1" : "0"
    }
}