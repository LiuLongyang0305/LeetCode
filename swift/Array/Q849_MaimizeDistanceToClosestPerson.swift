
//https://leetcode.com/problems/maximize-distance-to-closest-person/
class Solution {
    func maxDistToClosest(_ seats: [Int]) -> Int {
        if seats.count <= 2 {
            return 1
        }
        var startIndex: Int? = nil
        var maxDistance = 1
        for i in 0..<seats.count {
            if seats[i] == 0 {
                if startIndex == nil {
                    startIndex = i
                }
            } else {
                if startIndex != nil {
                    let zeroCount = i - startIndex!
                    if startIndex == 0 {
                        if zeroCount > maxDistance {
                            maxDistance = zeroCount
                        }
                    } else {
                        if zeroCount != 1 {
                            let currentMaxDistance = zeroCount / 2 + (zeroCount % 2 == 0 ? 0 : 1)
                            if currentMaxDistance > maxDistance {
                                maxDistance = currentMaxDistance
                            }
                        }
                    }
                    startIndex = nil
                }
            }
        }
        if seats[seats.count - 1] == 0 {
            let currentMaxDis = seats.count - startIndex!
            if currentMaxDis > maxDistance {
                return currentMaxDis
            }
        }
        return maxDistance
    }
}