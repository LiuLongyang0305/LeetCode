    // https://leetcode.cn/problems/best-reachable-tower/
    class Solution {
        private struct Position {
            var x: Int
            var y: Int

            func manhattanDistance(to anotherPosition: Position) -> Int {
                return abs(x - anotherPosition.x) + abs(y - anotherPosition.y)
            }

            func isLessThen(another pos: Position) -> Bool {
                if x == pos.x {
                    return y < pos.y
                }
                return x < pos.x
            }
        }

        private struct Tower {
            var pos: Position
            var quality: Int
        }
        func bestTower(_ towers: [[Int]], _ center: [Int], _ radius: Int) -> [Int] {
            let regularTowers = towers.map { t in
                Tower(pos: Position(x: t[0], y: t[1]), quality: t[2])
            }
            let regularCenter = Position(x: center[0], y: center[1])
            var sb: Position = Position(x:-1,y:-1)
            var maxQuality = -1
            for rt in regularTowers {
                if regularCenter.manhattanDistance(to: rt.pos) <= radius {

                    if rt.quality > maxQuality {

                        (sb,maxQuality) = (rt.pos,rt.quality)
                    } else if rt.quality == maxQuality {
                        if rt.pos.isLessThen(another: sb) {
                            sb = rt.pos
                        }
                    }


                }


            }
            return [sb.x,sb.y]
        }
    }
