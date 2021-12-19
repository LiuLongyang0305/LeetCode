 // https://leetcode.com/problems/watering-plants-ii/
class Solution {
    func minimumRefill(_ plants: [Int], _ capacityA: Int, _ capacityB: Int) -> Int {
        
        var ans = 0
        var i = 0
        var j = plants.count - 1
        var remainA = capacityA
        var remainB = capacityB
        while i <= j  {
            if i == j {
                if max(remainA, remainB) < plants[i] {
                    ans += 1
                }
            } else {
                if remainA >= plants[i] {
                    remainA -= plants[i]
                } else {
                    remainA = capacityA - plants[i]
                    ans += 1
                }
                if remainB >= plants[j] {
                    remainB -= plants[j]
                } else {
                    remainB = capacityB - plants[j]
                    ans += 1
                }
            }
            i += 1
            j -= 1
        }
        return ans
    }
}
