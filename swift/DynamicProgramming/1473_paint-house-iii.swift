// https://leetcode.com/problems/paint-house-iii/
class Solution {
    
    private  struct State: Hashable {
        var color: Int
        var blocks: Int
    }
    
    func minCost(_ houses: [Int], _ costs: [[Int]], _ m: Int, _ n: Int, _ target: Int) -> Int {
        
        var lastLevel = [State:Int]()
        var currentLevel = [State:Int]()
        
        let allPossibleColors = Array<Int>(1...n)
        lastLevel[State(color: -1, blocks: 0)] = 0
        
        for (house,paintedColor) in houses.enumerated() {
            
            let possibleColors = paintedColor == 0 ? allPossibleColors : [paintedColor]
            
            for currentHouseColor in possibleColors {
                
                for (lastHouseState,cost) in lastLevel {
                    let blockes = lastHouseState.blocks + (currentHouseColor == lastHouseState.color ? 0 : 1)
                    if blockes <= target  {
                        
                        let curCost = cost + (currentHouseColor == paintedColor ? 0 : costs[house][currentHouseColor - 1])
                        
                        let curState = State(color: currentHouseColor, blocks: blockes)
                        if let temp = currentLevel[curState] {
                            currentLevel[curState] = min(temp, curCost)
                        } else {
                            currentLevel[curState] = curCost
                        }
                        
                    }
                }
                
                
            }
            
            (lastLevel,currentLevel) = (currentLevel,[:])
        }
        var ans = Int.max
        for (state,cost) in lastLevel {
            if state.blocks == target {
                ans = min(ans, cost)
            }
        }
        return ans == Int.max ? -1 : ans
    }
}

