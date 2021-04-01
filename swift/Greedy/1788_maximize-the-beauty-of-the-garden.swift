// https://leetcode.com/problems/maximize-the-beauty-of-the-garden/
class Solution {
    private typealias Pair = (first:Int,second:Int)
    func maximumBeauty(_ flowers: [Int]) -> Int {
        var map = [Int:Pair]()
        var positivePreffix = [0]
        let N = flowers.count
        for idx in 0..<N {
            positivePreffix.append(positivePreffix.last! + (flowers[idx] < 0 ? 0 : flowers[idx]))
            if var p = map[flowers[idx]] {
                p.second = idx
                map[flowers[idx]] = p
            } else {
                map[flowers[idx]] = (idx,idx)
            }
        }
        // print(map)
        // print(positivePreffix)
        var ans = Int.min
        for (beauty,indices) in map {
            guard indices.second != indices.first else {
                continue
            }
            ans = max(ans, 2 * beauty + positivePreffix[indices.second] - positivePreffix[indices.first + 1])
        }
        return ans
    }
}
