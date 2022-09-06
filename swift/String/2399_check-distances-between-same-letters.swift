 // https://leetcode.com/problems/check-distances-between-same-letters/
class Solution {
    func checkDistances(_ s: String, _ distance: [Int]) -> Bool {
        let values = s.map { Int($0.asciiValue ?? 0) - 97}
        var last = [Int](repeating: -1, count: 26)
        let N = values.count
        for i in 0..<N {
            let idx = values[i]
            if last[idx] != -1 {
                guard distance[idx] == i - last[idx] - 1 else {return false}
            } else {
                last[idx] = i
            }
        }
        return true
    }
}