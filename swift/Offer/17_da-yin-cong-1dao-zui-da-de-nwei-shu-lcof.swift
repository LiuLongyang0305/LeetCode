// https://leetcode-cn.com/problems/da-yin-cong-1dao-zui-da-de-nwei-shu-lcof/
class Solution {
    func printNumbers(_ n: Int) -> [Int] {
        var limit = 0
        for _ in 0..<n {
            limit = limit * 10 + 9
        }
        return Array<Int>(1...limit)
    }
}