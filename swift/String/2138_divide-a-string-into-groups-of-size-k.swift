// https://leetcode.com/problems/divide-a-string-into-groups-of-size-k/
class Solution {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        var ans = [String]()
        var sCopy = s
        if s.count % k != 0 {
            sCopy += String(repeating: fill, count: k - s.count % k )
        }
        while !sCopy.isEmpty {
            ans.append(String(sCopy.prefix(k)))
            sCopy.removeFirst(k)
        }
        return ans
    }
}