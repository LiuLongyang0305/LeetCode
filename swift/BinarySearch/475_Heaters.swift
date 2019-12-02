//https://leetcode.com/problems/heaters/ 
class Solution {
     func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var ans = 0
        let sortedHouses  = houses.sorted()
        let sortedHeaters =  heaters.sorted()
        var startIndex = 0
        while startIndex < sortedHouses.count && sortedHouses[startIndex] <= sortedHeaters.first! {
                startIndex += 1
        }
        guard startIndex != houses.count else {
            return sortedHeaters[0] - sortedHouses[0]
        }
        var endIndex = houses.count  - 1
        while endIndex >= 0 && sortedHouses[endIndex] >= sortedHeaters.last! {
            endIndex -= 1
        }
        guard endIndex != -1 else {
            return sortedHouses.last! - sortedHeaters.last!
        }
        if startIndex != 0 {
            ans = max(ans, sortedHeaters[0] - sortedHouses[0])
        }
        if endIndex != sortedHouses.count -  1 {
            ans = max(ans, sortedHouses.last! - sortedHeaters.last!)
        }

        guard startIndex <= endIndex else {
            return ans
        }
        for houseIndex in startIndex...endIndex {
            let house  = sortedHouses[houseIndex]
            var left = 0
            var right = sortedHeaters.count - 1
            var flag = false
            while left < right {
                let mid = left + (right - left) >> 1
                if sortedHeaters[mid] == house {
                    flag = true
                    break
                } else if sortedHeaters[mid] > house {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            if !flag {
                ans = max(ans, min( house - sortedHeaters[left - 1], sortedHeaters[left] - house))
            }
        }
        return  ans
     }
 }