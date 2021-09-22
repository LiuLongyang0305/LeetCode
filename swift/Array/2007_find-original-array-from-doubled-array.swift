// https://leetcode.com/problems/find-original-array-from-doubled-array/
class Solution {
    func findOriginalArray(_ changed: [Int]) -> [Int] {
        var counter = [Int](repeating: 0, count: 100005)
        changed.forEach { counter[$0] += 1}
        guard counter[0] & 1 == 0 else {
            return []
        }
        var ans = counter[0] == 0 ? [Int]() : [Int](repeating: 0, count: counter[0] >> 1)
        
        for num in 1..<100000 where counter[num] > 0 {
            guard num * 2 <= 100000 else {
                return []
            }
            guard counter[num << 1] >= counter[num] else {
                return []
            }
            ans += [Int](repeating: num, count: counter[num])
            counter[num << 1] -= counter[num]
        }
        return ans
    }
}