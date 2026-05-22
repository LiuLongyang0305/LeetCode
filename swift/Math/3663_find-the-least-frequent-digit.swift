//https://leetcode.cn/problems/find-the-least-frequent-digit/
class Solution {
    func getLeastFrequentDigit(_ n: Int) -> Int {
        var counter = [Int:Int]()
        var temp = n
        while temp > 0 {
            counter[temp % 10,default: 0] += 1
            temp /= 10
        }
        let sortedCpunter = counter.sorted { p1, p2 in
            if p1.value == p2.value {
                return p1.key < p2.key
            }
            return p1.value < p2.value
        }
        return sortedCpunter[0].key
    }
}
