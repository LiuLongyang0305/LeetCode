//https://leetcode.com/problems/maximum-candies-you-can-get-from-boxes/
class Solution {
    func maxCandies(_ status: [Int], _ candies: [Int], _ keys: [[Int]], _ containedBoxes: [[Int]], _ initialBoxes: [Int]) -> Int {
        var totalCandies = 0
        
        var visited = Set<Int>()
        var queue = initialBoxes
        var openableBoxes = Set<Int>()
        for box in 0..<status.count {
            if status[box] == 1 {
                openableBoxes.insert(box)
            }
        }
        while !queue.isEmpty && !openableBoxes.isEmpty{
            var nextLevel = [Int]()
            for box in queue {
                if !visited.contains(box) {
                    if status[box] == 1 || openableBoxes.contains(box) {
                        totalCandies += candies[box]
                        visited.insert(box)
                        for key in keys[box] {
                            openableBoxes.insert(key)
                        }
                        openableBoxes.remove(box)
                        nextLevel.append(contentsOf: containedBoxes[box])
                    } else {
                        nextLevel.append(box)
                    }
                }
            }
            queue = nextLevel
        }
        return totalCandies
    }
 }