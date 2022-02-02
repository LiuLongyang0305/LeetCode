// https://leetcode.com/problems/smallest-greater-multiple-made-of-two-digits/
class Solution {
    private let limit = (1 << 31) - 1
    func findInteger(_ k: Int, _ digit1: Int, _ digit2: Int) -> Int {
        guard digit1 > 0 || digit2 > 0 else {return -1}
        let (smaller,larger) = (min(digit1, digit2),max(digit1, digit2))
        var queue = [smaller,larger]
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            guard cur < limit else {return -1}
            if cur > k && cur % k == 0 {
                return cur
            }
            queue.append(contentsOf: [cur * 10 + smaller,cur * 10 + larger])
        }
        return -1
    }
}