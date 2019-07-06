class Q120_Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0].min()!
        }
        var minResult : [[Int]] = [triangle.last!]
        let length = triangle.count
        for i in 2...length {
            var currentLevel = Array<Int>(repeating: 0, count: triangle[length - i].count)
            for j in 0..<triangle[length - i].count {
                currentLevel[j] = min(minResult.first![j], minResult.first![j + 1]) + triangle[length - i][j]
            }
            minResult.insert(currentLevel, at: 0)
        }
        return minResult[0][0]
    }
    
    func minimumTotalCompressed(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0].min()!
        }
        var minResult : [Int] = triangle.last!
        let length = triangle.count
        for i in 2...length {
            for j in 0..<triangle[length - i].count {
                minResult[j] = min(minResult[j], minResult[j + 1]) + triangle[length - i][j]
            }
        }
        return minResult[0]
    }
}