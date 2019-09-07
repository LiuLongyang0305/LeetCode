class Solution {
    typealias MinDis = (left: Int,right: Int)
    func shortestDistanceColor(_ colors: [Int], _ queries: [[Int]]) -> [Int] {
        var ans = [Int]()
        var minDistances = Array<Array<MinDis>>(repeating: Array<MinDis>(repeating: (Int.max,Int.max), count: 3), count: colors.count)
        for i in 0..<colors.count {
            let tempColour  = colors[i] - 1
            minDistances[i][tempColour] = (0,0)
            if i != 0 {
                let last = colors[i - 1] - 1
                if last != tempColour {
                    minDistances[i][last].left = 1
                }
                for j in 0...2 {
                    if j != tempColour && j != last && minDistances[i - 1][j].left != Int.max {
                        minDistances[i][j].left = minDistances[i - 1][j].left + 1
                    }
                }
            }
        }
        for i in (0..<colors.count).reversed() {
            let tempColour  = colors[i] - 1
            if i != colors.count - 1 {
                let last = colors[i + 1] - 1
                if last != tempColour {
                    minDistances[i][last].right = 1
                }
                for j in 0...2 {
                    if j != tempColour && j != last && minDistances[i + 1][j].right != Int.max {
                        minDistances[i][j].right = minDistances[i + 1][j].right + 1
                    }
                }
            }
        }
        for query in queries {
            let distances = minDistances[query[0]]
            let tempDis = min(distances[query[1] - 1].left,distances[query[1] - 1].right)
            ans.append(tempDis == Int.max ? -1 : tempDis)
        }
        return ans
    }
}