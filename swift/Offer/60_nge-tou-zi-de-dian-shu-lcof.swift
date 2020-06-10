// https://leetcode-cn.com/problems/nge-tou-zi-de-dian-shu-lcof/
class Solution {
    private let oneSixth =  1.0 / 6.0
    func twoSum(_ n: Int) -> [Double] {
        var map = [Int:Double]()
        map[0] = 1
        for _ in 1...n {
            var next = [Int: Double]()
            for num in 1...6 {
                for (sum,p) in  map{
                    let nextSum = sum + num
                    next.updateValue((next[nextSum] ?? 0) + p * oneSixth, forKey: nextSum)
                }
            }
            map = next
        }
        return   map.sorted { (dic1, dic2) -> Bool in
            dic1.key < dic2.key
        }.map {$0.value}
    }
}