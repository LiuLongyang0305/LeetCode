// https://leetcode.com/problems/get-biggest-three-rhombus-sums-in-a-grid/
class Solution {
    func getBiggestThree(_ grid: [[Int]]) -> [Int] {
        var ans = Set<Int>()
        
        let M = grid.count
        let N = grid[0].count
        func updateAns(_ sum: Int) {
            guard ans.count >= 3 else {
                ans.insert(sum)
                return
            }
            guard !ans.contains(sum) else {
                return
            }
            let minEle = ans.min()!
            guard sum > minEle else {
                return
            }
            ans.insert(sum)
            ans.remove(minEle)
        }
        func getSum(_ r: Int, _ c: Int,_ length: Int) -> Int? {
            guard r + 2 * length - 2 < M else {
                return nil
            }
            var sum = 0
            let maxRow =  r + 2 * length - 2
            for delta in 0..<length {
                sum += grid[r + delta][c - delta] + grid[r + delta][c + delta] + grid[maxRow - delta][c + delta] + grid[maxRow - delta][c - delta]
                
            }
            sum -= (grid[r][c] + grid[maxRow][c] + grid[r + length - 1][c - length + 1] + grid[r + length - 1][c + length - 1])
            return sum
        }
        func update(_ r: Int, _ c: Int) {
            let maxLength = min(c + 1, N - c)
            updateAns(grid[r][c])
            var length = 2
            while length <= maxLength {
                if let s = getSum(r, c, length) {
                    updateAns(s)
                }
                length += 1
            }
            
        }
        for r in 0..<grid.count {
            for c in 0..<grid[0].count {
                update(r, c)
            }
        }
        
        return ans.sorted { $0 > $1}
    }
}