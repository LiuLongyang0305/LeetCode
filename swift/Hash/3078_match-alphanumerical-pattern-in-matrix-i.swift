//https://leetcode.cn/problems/match-alphanumerical-pattern-in-matrix-i/
class Solution {
    private struct Pos:Hashable,CustomStringConvertible {
        var description: String {
            return "(\(x),\(y))"
        }

        var x: Int
        var y: Int
    }
    func findPattern(_ board: [[Int]], _ pattern: [String]) -> [Int] {
        let (chPOS,numPos) = getTarget(pattern)
        // let patternNums = Set<Int>(numPos.keys)
        // print(chPOS)
        // print(numPos)
        var posToValues = [Pos:Int]()
        for (num,pos) in numPos {
            for p in pos {
                posToValues[p] = num
            }
        }

        let BM = board.count
        let BN = board[0].count

        let PM = pattern.count
        let PN = pattern[0].count

        func check(_ sx:Int, _ sy:Int) -> Bool {
            guard sx + PM - 1 < BM else {return false}
            guard sy + PN - 1 < BN else {return false}

            var map = [Int:Set<Pos>]()
            for dx in 0..<PM {
                for dy in 0..<PN {
                    let p = Pos(x: dx, y: dy)
                    let curNum = board[sx + dx][sy + dy]
                    if let num = posToValues[p] {
                        guard curNum == num else {return false}
                    } else {
                        // guard !patternNums.contains(curNum) else {return false}
                        map[curNum,default: []].insert(Pos(x: dx, y: dy))
                    }
                }
            }
            return Set<Set<Pos>>(map.values) == chPOS
        }
        for i in 0..<BM {
            for j in 0..<BN {
                if check(i, j) {
                    return [i,j]
                }
            }
        }
        return [-1,-1]
    }




    private func getTarget(_ pattern: [String]) -> (Set<Set<Pos>>,[Int:Set<Pos>]) {
        let patternChars = pattern.map { [Character]($0)}
        var map = [Character:Set<Pos>]()
        var map1 = [Int:Set<Pos>]()

        for (i,chs) in patternChars.enumerated() {
            for (j,ch) in chs.enumerated() {
                if ch.isNumber {
                    map1[Int(ch.asciiValue! - 48),default: []].insert(Pos(x: i, y: j))
                } else {
                    map[ch,default: []].insert(Pos(x: i, y: j))
                }
            }
        }

        return (Set<Set<Pos>>(map.values),map1)
    }
}
