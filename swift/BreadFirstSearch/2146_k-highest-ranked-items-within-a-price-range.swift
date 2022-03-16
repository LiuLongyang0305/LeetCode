// https://leetcode.com/problems/k-highest-ranked-items-within-a-price-range/

class Solution {
    private struct Good: CustomStringConvertible {
        var description: String {
            return ("\(cost),\(price),\(row),\(col))")
        }
        
        var cost:Int
        var price:Int
        var row: Int
        var col: Int
    }
    private typealias Direction = (dr:Int,dc:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    private typealias Position = (r:Int,c: Int)
    func highestRankedKItems(_ grid: [[Int]], _ pricing: [Int], _ start: [Int], _ k: Int) -> [[Int]] {
        var ans = [[Int]]()
        
        let M = grid.count
        let N = grid[0].count
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)
        var queue = [Position]()
        var step = 0
        let (lowest,highest) = (pricing[0],pricing[1])
        queue.append((start[0],start[1]))
        visited[start[0]][start[1]] = true
        if grid[start[0]][start[1]] >= lowest && grid[start[0]][start[1]] <= highest {
            ans.append(start)
            guard k > 1 else {return ans}
        }
        while !queue.isEmpty {
            step += 1
            var newQueue = [Position]()
            var possibleGoods = [Good]()
            for (r,c) in queue {
                for (dr,dc) in directions {
                    let nr = r + dr
                    let nc = c + dc
                    guard nr >= 0 && nr < M && nc >= 0 && nc < N && !visited[nr][nc] && grid[nr][nc] >= 1 else {
                        continue
                    }
                    visited[nr][nc] = true
                    newQueue.append((nr,nc))
                    if grid[nr][nc] >= lowest && grid[nr][nc] <= highest {
                        possibleGoods.append(Good(cost: step, price: grid[nr][nc], row: nr, col: nc))
                    }
                }
            }
            // print(possibleGoods)
            possibleGoods.sort { g1, g2 in
                if g1.price != g2.price {
                    return g1.price < g2.price
                }
                if g1.row != g2.row {
                    return g1.row < g2.row
                }
                return g1.col < g2.col
            }
            // print(possibleGoods)
            ans.append(contentsOf: possibleGoods.prefix(min(possibleGoods.count, k - ans.count)).map({ [$0.row,$0.col]}))
            guard ans.count < k else {break}
            queue = newQueue
        }
        return ans
    }
}
