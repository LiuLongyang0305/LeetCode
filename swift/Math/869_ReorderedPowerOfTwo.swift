//https://leetcode.com/problems/reordered-power-of-2/
extension  Int {
    var digitsCounter: [Int:Int] {
        var ans = [Int:Int]()
        var temp = self
        while temp > 0 {
            let remainder = temp % 10
            if let c = ans[remainder] {
                ans.updateValue(c + 1, forKey: remainder)
            } else {
                ans.updateValue(1, forKey: remainder)
            }
            temp /= 10
        }
        return ans
    }
}
let powerTwoNums: Set<[Int:Int]> = [[2: 1, 8: 1, 0: 1, 3: 1, 1: 2, 4: 2, 7: 2], [7: 1, 6: 1, 9: 1, 3: 1, 0: 1, 1: 1, 2: 1, 5: 1, 8: 1], [6: 2, 8: 1, 4: 2, 3: 1, 2: 1, 5: 2], [7: 2, 2: 2, 1: 2, 4: 1, 8: 1, 3: 1], [4: 1, 8: 2, 6: 2, 0: 1, 1: 1, 7: 1], [2: 1, 4: 2, 3: 3, 5: 2], [6: 2, 2: 1, 1: 2, 7: 3], [3: 1, 0: 1, 8: 4, 6: 1], [4: 3, 3: 1, 1: 1, 9: 1, 0: 1], [9: 1, 7: 1, 2: 2, 5: 1, 1: 1, 0: 1], [7: 1, 6: 1, 8: 1, 5: 1, 1: 1, 4: 1, 0: 1], [5: 1, 2: 2, 4: 1, 8: 2], [4: 2, 2: 2, 6: 1, 1: 1], [0: 1, 3: 1, 2: 1, 1: 2, 7: 1], [3: 1, 5: 2, 6: 2], [7: 1, 2: 1, 8: 1, 6: 1, 3: 1], [8: 1, 3: 1, 1: 1, 4: 1, 6: 1], [1: 1, 8: 1, 2: 1, 9: 1], [9: 1, 0: 1, 6: 1, 4: 1], [8: 1, 0: 1, 4: 1, 2: 1], [1: 1, 0: 1, 2: 1, 4: 1], [5: 1, 1: 1, 2: 1], [5: 1, 2: 1, 6: 1], [2: 1, 8: 1, 1: 1], [4: 1, 6: 1], [2: 1, 3: 1], [1: 1, 6: 1], [8: 1], [4: 1], [2: 1], [1: 1]]
class Solution {
    func reorderedPowerOf2(_ N: Int) -> Bool {
        return powerTwoNums.contains(N.digitsCounter)
    }
}
