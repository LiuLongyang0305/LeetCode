//  https://leetcode.com/problems/the-maze-iii/
class Solution {
    private struct Node:Hashable, CustomStringConvertible {
        var description: String {
            return "(\(x),\(y))"
        }
        var x: Int
        var y: Int
    }
    
    private typealias Direction = (dx:Int,dy:Int)
    private typealias BFSNode = (path:String,node:Node,distance:Int)
        //                                      d     l     r      u
    private let directions:[Direction] = [(1,0),(0,-1),(0,1),(-1,0)]
    private let directionChars: [Character] = ["d","l","r","u"]
    private let space = 0
    private let wall = 1

    private typealias DisInfo = (dis:Int,path:String)

    func findShortestWay(_ maze: [[Int]], _ ball: [Int], _ hole: [Int]) -> String {
        
        let newMaze = modifyMaze(ori: maze)
        let (holeX,holeY) = (hole[0] + 1,hole[1] + 1)
        let startNode = Node(x: ball[0] + 1, y: ball[1] + 1)
        let graph = buildGraph(base: newMaze,startNode)


        //判断是否会掉在洞里
        func check(_ from: Node, _ to:Node, _ dir: Direction) -> Bool {

            var x = from.x
            var y = from.y

            while true {
                if x == holeX && y == holeY {
                    return true
                }
                if x == to.x && y == to.y {
                    break
                }
                x += dir.dx
                y += dir.dy
            }
            return false
        }


        //BFS枚举所有情况
        let M = newMaze.count
        let N = newMaze[0].count
        var distance = [[DisInfo]](repeating: [DisInfo](repeating: (Int.max,""), count: N), count: M)

        var ans = ""
        var curMinDis = Int.max

        var queue = [BFSNode]()
        queue.append(("",startNode,0))
        distance[startNode.x][startNode.y] = (0,"")

        while !queue.isEmpty {
            var newQueue = [BFSNode]()

            for (path,node,dis) in queue {

                for idx in 0..<4 {
                    let dirChar = directionChars[idx]
                    guard let nextNode = graph[node]?[dirChar] else {continue}
                    let newPath = path + "\(dirChar)"
                    if check(node, nextNode, directions[idx]) {
                            //                        print("ori = \(ans)   new = \(newPath)")
                        let t = dis + abs(holeX - node.x) + abs(holeY - node.y)
                        if t < curMinDis {
                            ans = newPath
                            curMinDis = t
                        } else if t == curMinDis {
                            ans = min(ans, newPath)
                        }
                    }
                    let newDis = dis + abs(nextNode.x - node.x) + abs(node.y - nextNode.y)
                    if  newDis < distance[nextNode.x][nextNode.y].dis  {
                        distance[nextNode.x][nextNode.y] = (newDis,newPath)
                        newQueue.append((newPath,nextNode,newDis))
                    } else if newDis == distance[nextNode.x][nextNode.y].dis{
                        if distance[nextNode.x][nextNode.y].path > newPath {
                            distance[nextNode.x][nextNode.y].path = newPath
                            newQueue.append((newPath,nextNode,newDis))
                        }
                    }
                }
            }
            queue = newQueue
        }
        return ans.isEmpty ? "impossible" : ans
    }
    

        //四周加上围墙，减少处理过程
    private func modifyMaze(ori maze: [[Int]]) -> [[Int]] {
        let N = maze[0].count
        let horizonWall = [Int](repeating: wall, count: N)
        var newMaze =  maze
        newMaze.insert(horizonWall, at: 0)
        newMaze.append(horizonWall)
        return newMaze.map {[wall] + $0 + [wall]}
    }
    

        //建图
    private func buildGraph(base maze: [[Int]], _ startNode: Node) -> [Node:[Character:Node]] {
        var graph = [Node:[Character:Node]]()
        func dfs(_ node: Node) {
            guard nil == graph[node] else {return}
            graph[node] = [:]
            let (x,y) = (node.x, node.y)
            for idx in 0..<4 {
                var (nx,ny) = (x,y)
                while maze[nx][ny] == space {
                    nx += directions[idx].dx
                    ny += directions[idx].dy
                }
                let newNode = Node(x: nx - directions[idx].dx, y: ny - directions[idx].dy)
                guard newNode != node else {continue}
                graph[node]?[directionChars[idx]] = newNode
                dfs(newNode)
            }
        }
        dfs(startNode)
        return graph
    }
    
}