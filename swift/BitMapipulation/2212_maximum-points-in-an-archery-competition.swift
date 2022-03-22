// https://leetcode.com/problems/maximum-points-in-an-archery-competition/
class Solution {
    func maximumBobPoints(_ numArrows: Int, _ aliceArrows: [Int]) -> [Int] {
        
        var curScore = 0
        var ans = [Int]()
        let maxMask = 1 << 12
        
        
        func caculateScore(of mask: Int) -> (score:Int,arrows:[Int]) {
            var arrows = [Int](repeating: 0, count: 12)
            var score = 0
            var remainRows = numArrows
            
            for i in 0..<12 {
                if mask & (1 << i) != 0 {
                    guard remainRows > aliceArrows[i] else {
                        return (0,[])
                    }
                    arrows[i] = aliceArrows[i] + 1
                    remainRows -= arrows[i]
                    score += i
                }
            }
            if remainRows > 0 {
                let idx = arrows.firstIndex { $0 > 0}!
                arrows[idx] += remainRows
            }
            
            return (score,arrows)
        }
        
        
        
        var mask = 1
        
        while mask < maxMask {
            let t = caculateScore(of: mask)
            if curScore < t.score {
                curScore = t.score
                ans = t.arrows
            }
            mask += 1
        }
        // print(curScore)
        return ans
    }
}