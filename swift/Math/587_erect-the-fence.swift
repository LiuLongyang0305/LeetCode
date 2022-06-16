// https://leetcode.com/problems/erect-the-fence/
struct Point {
    var x: Int
    var y: Int
}

struct Vector {
    var dx: Int
    var dy: Int
    var squreDistance: Int {
        return dx * dx + dy * dy
    }

}
func cross(_ u: Point, _ v: Point, _ w: Point) -> Int {
    let v1 = Vector(dx: v.x - u.x, dy: v.y - u.y)
    let v2 = Vector(dx: w.x - u.x, dy: w.y - u.y)
    return cross(v1, v2)
}
    //返回值大于0，则v在u的左上；小于0则v在u的右下
func cross(_ u: Vector, _ v: Vector) -> Int {
    return u.dx * v.dy - u.dy * v.dx
}

func distance(_ u: Point, _ v: Point) -> Int{
    return Vector(dx: v.x - u.x, dy: v.y - u.y).squreDistance
}

class Solution {
    func outerTrees(_ trees: [[Int]]) -> [[Int]] {
        return outerTrees_Jarvis(trees)
    }
    /**
     1.  首先找到凸包上的一个点，本题中找的是最左侧的点。
     2.   进入循环。假设已经确定有一系列点在凸包上了,且最后一个为p.每次循环的目标是找到另外一个点q，使得其他所有点都在向量pq的一侧（左上侧或者右下侧）。
     3. 找到之后，把pq以及与pq共线的点加入凸包序列。
     4. 时间复杂度O(n^2),空间复杂度O(n)。
     */
    private func outerTrees_Jarvis(_ trees:[[Int]]) -> [[Int]] {
        let N = trees.count
        guard N > 4 else {
            return trees
        }
        let points = trees.map {Point(x: $0[0], y: $0[1])}
            ///找到最左侧的点
        var leftMost = 0
        for  i in 0..<N {
            if points[i].x < points[leftMost].x || (points[i].x == points[leftMost].x && points[i].y < points[leftMost].y) {
                leftMost = i
            }
        }
        var ans = [Point]()
        var visited = [Bool](repeating: false, count: N)

            ///每一个循环都是找一个向量使得所有的点都在该向量的左上侧或者右下侧，此处为左上侧。
        var p = leftMost
        repeat {
            var q = (p + 1) % N
            for r in 0..<N {

                if cross(points[p], points[q], points[r]) < 0 {
                    q = r
                }
            }
                ///是否存在i使得p q i共线
            for i in 0..<N {
                if(visited[i] || i == p || i == q) {
                    continue
                }
                if cross(points[p], points[q], points[i]) == 0 {
                    ans.append(points[i])
                    visited[i] = true
                }
            }
            if !visited[q] {
                ans.append(points[q])
                visited[q] = true
            }
            p = q

        } while (p != leftMost)
        return ans.map { [$0.x,$0.y]}
    }



    /**
     1. 选择凸包上的一个点*bottom*。此处选择*y*值最小的点为起始点，可以断定该点一定在凸包上。
     2. 以*bottom*为原点，对其他点按照极角大小排序，极角相同，则按照距离排序，表征距离原点的远近。
     3. 特殊情况：假设共线的点在凸壳的最后一条边，则这些贡献的点需要逆序。
     4. 从有序数组的开始两个点考虑，把他们放入栈中。考虑低三个点，如果这个点与栈顶的点相比于前一条直线是左拐，我们把这个点添加到栈顶，表示暂时添加到凸壳上。如果相对于前一条线是右拐的则说明前一个点不应该在凸壳上。

     */
    private func outerTrees_Graham(_ trees: [[Int]]) -> [[Int]] {
        let N = trees.count
        guard N > 4 else {
            return trees
        }
        var points = trees.map {Point(x: $0[0], y: $0[1])}
        var bottom = 0
        for i in 1..<N {
            if points[i].y < points[bottom].y {
                bottom = i
            }
        }
        points.swapAt(bottom, 0)
            ///排序
        var sortedPoints =  points.dropFirst().sorted { p1, p2 in
            let diff = cross(points[0], p1, p2)
            if(diff == 0) {
                return distance(points[0], p1) < distance(points[0], p2)
            } else {
                return diff > 0
            }
        }
        sortedPoints.insert(points[0], at: 0)
            ///逆序最后共线的点
        var r = N - 1
        while r >= 0 && cross(sortedPoints[0], sortedPoints[N - 1], sortedPoints[r]) == 0 {
            r -= 1
        }

        var l = r + 1
        var h = N - 1
        while l < h {
            sortedPoints.swapAt(l, h)
            l += 1
            h -= 1
        }


            ///扫描
        var stack = [Int]()
        stack.append(0)
        stack.append(1)
        for i in 2..<N {
            var  top = stack.removeLast()
            while !stack.isEmpty && cross( sortedPoints[stack.last!], sortedPoints[top],sortedPoints[i]) < 0 {
                top = stack.removeLast()
            }
            stack.append(top)
            stack.append(i)
        }
        return stack.map { i in
            [sortedPoints[i].x, sortedPoints[i].y]
        }
    }
    /**
     1. 排序：根据*x*值的大小；如果*x*值相同，则根据*y*值大小。
     2. 从左向右扫描，确定下凸壳。然后从右向左扫描，确定上凸壳。具体方法与上面类似。
     */
    private func outerTrees_Andrew(_ trees: [[Int]]) -> [[Int]] {
        let N = trees.count
        guard N > 4 else {
            return trees
        }
        var points = trees.map {Point(x: $0[0], y: $0[1])}
        points.sort { p1, p2 in
            guard p1.x != p2.x else {
                return p1.y < p2.y
            }
            return p1.x < p2.x
        }

        var hull = [Int]()
        var used = [Bool](repeating:false, count: N)
        hull.append(0)
            ///凸包下半部分
        for i in 1..<N {
            while hull.count > 1 && cross(points[hull[hull.count - 2]], points[hull[hull.count - 1]], points[i])  < 0 {
                used[hull.removeLast()] = false
            }
            used[i] = true
            hull.append(i)
        }
            ///凸包上半部分
        let M = hull.count
        var i = N - 2
        while i >= 0 {
            if !used[i] {
                while hull.count > M && cross(points[hull[hull.count - 2]], points[hull[hull.count - 1]], points[i])  < 0 {
                    used[hull.removeLast()] = false
                }
                used[i] = true
                hull.append(i)
            }
            i -= 1
        }
        hull.removeLast()
        return hull.map { idx in
            [points[idx].x, points[idx].y]
        }
    }
}