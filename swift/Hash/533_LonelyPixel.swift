//  https://leetcode.com/problems/lonely-pixel-ii/
class Solution {
    func findBlackPixel(_ picture: [[Character]], _ K: Int) -> Int {
        guard !picture.isEmpty && !picture[0].isEmpty else {
            return 0
        }
        let M = picture.count
        let N = picture[0].count
        var cols = [Int:[Int]]()
        var rows = [Int:[Int]]()
        
        for r in 0..<M {
            for c in 0..<N {
                if picture[r][c] == "B" {
                    if nil == cols[c] {
                        cols[c] = []
                    }
                    cols[c]?.append(r)
                    if nil == rows[r] {
                        rows[r] = []
                    }
                    rows[r]?.append(c)
                }
            }
        }
        
        var finalRows = Set<Int>()
        for (r,indices) in rows {
            if indices.count == K {
                finalRows.insert(r)
            }
        }
        let pictureMap = picture.map {$0.reduce("") {$0 + "\($1)"}}
        func check(_ indices: [Int]) -> Bool {
            guard indices.count == K else {
                return false
            }
            var target = ""
            for r in indices {
                guard finalRows.contains(r) else {
                    return false
                }
                if target.isEmpty {
                    target = pictureMap[r]
                    continue
                }
                guard target == pictureMap[r] else {
                    return false
                }
                
            }
            return true
        }
        var ans = 0
        for (_,indices) in cols {
            if check(indices) {
                ans += K
            }
        }
        return ans
    }
}