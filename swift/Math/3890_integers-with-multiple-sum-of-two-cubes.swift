    // https://leetcode.cn/problems/integers-with-multiple-sum-of-two-cubes/


func cal() -> [Int] {
    var couter = [Int:Int]()
    var canditates = [Int]()
    for a in 1...1000 {
        for b in a...1000 {
            couter[a * a * a + b * b * b,default: 0] += 1
        }
    }
    for (v,c) in couter {
        if c >= 2 {canditates.append(v)}
    }
    canditates.sort()
    return canditates
}
var canditates = cal()
class Solution {
    func findGoodIntegers(_ n: Int) -> [Int] {
        guard let idx = canditates.lastIndex(where: { $0 <= n}) else {return []}
        return [Int](canditates[...idx])
    }
}
