 // https://leetcode.com/problems/strange-printer-ii/
class Solution {
    //各种颜色包裹矩形的信息
    private typealias Quater = (minX:Int,minY:Int,maxX:Int,maxY:Int)
    func isPrintable(_ targetGrid: [[Int]]) -> Bool {
        var colourToQuqter = [Int:Quater]()
        let M = targetGrid.count
        let N = targetGrid[0].count

        //计算各种颜色包裹矩形信息
        for r in 0..<M {
            for c in 0..<N {
                if var q = colourToQuqter[targetGrid[r][c]] {
                    if r < q.maxX {
                        q.minX = r
                    }
                    if r > q.maxX {
                        q.maxX = r
                    }
                    if c < q.minY {
                        q.minY = c
                    }
                    if c > q.maxX {
                        q.maxY = c
                    }
                    colourToQuqter[targetGrid[r][c]] = q

                } else {
                    colourToQuqter[targetGrid[r][c]] = (r,c,r,c)
                }
            }
        }
        //建图表示colour之间的依赖关系
        var graph = [Int:Set<Int>]()
        for c1 in 1...60 {
            guard let q1 = colourToQuqter[c1] else {continue}
            for c2 in stride(from: c1 + 1, through: 60, by: 1) {
                guard let q2 = colourToQuqter[c2] else {continue}

                //枚举某一个矩形里面的左右的点，找到所有相交的的点，判断目标颜色，如果目标颜色是两个包裹矩形颜色之一，则可以在途中添加依赖关系。
                //当前格子目标的颜色肯定是后打印的
                for r in q1.minX...q1.maxX {
                    for c in q1.minY...q1.maxY {
                        if r >= q2.minX && r <= q2.maxX && c >= q2.minY && c <= q2.maxY && (targetGrid[r][c] == c1 || targetGrid[r][c] == c2) {
                            if targetGrid[r][c] == c1 {
                                   //先涂c2再c1
                                   graph[c2,default: []].insert(c1)
                               } else {
                                   //先涂c1再c2
                                   graph[c1,default: []].insert(c2)
                               }

                        }
                    }
                }


            }
        }

        //统计各种颜色的入度
        var inDegree = [Int:Int]()
        for (_,next) in graph {
            for n in next {
                inDegree[n,default: 0] += 1
            }
        }

        //拓扑排序
        var queue = [Int]()
        for color in 1...60 {
            if let _ = graph[color]{
                if nil == inDegree[color] {
                    queue.append(color)
                }
            }
        }
        while !queue.isEmpty {
            var newQueue = [Int]()
            for color in queue {
                guard let next = graph[color] else {continue}
                for n in next {
                    inDegree[n,default: 0] -= 1
                    if (inDegree[n] ?? Int.max) == 0 {
                        newQueue.append(n)
                    }
                }

            }
            queue = newQueue
        }
        //任何颜色的入度都是0，说明可以正常打印
        for (_,degree) in inDegree {
            guard degree == 0 else {
                return false
            }
        }
        return true
    }
}