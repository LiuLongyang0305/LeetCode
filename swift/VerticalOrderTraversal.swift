// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    class Position: Hashable {
        var x : Int
        var y : Int
        init(_ x : Int,_ y : Int) {
            self.x = x
            self.y = y
        }
        static func == (lhs: Solution.Position, rhs: Solution.Position) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
        func hash(into hasher: inout Hasher) {
            hasher.combine(x)
            hasher.combine(y)
        }
    }
    
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        if nil == root {
            return result
        }
        var minX : Int = 0
        var maxX : Int = 0
        var minY : Int = 0
        class AnnotatedNode {
            var node : TreeNode?
            var position : Position
            init(_ node : TreeNode?,_ posX : Int,_ posY :Int) {
                self.node = node
                self.position = Position(posX, posY)
            }
        }
        var annotatedNodes = Array<AnnotatedNode>()
        annotatedNodes.append(AnnotatedNode(root,0,0))
        result.append([Int]())
        while !annotatedNodes.isEmpty {
            let length = annotatedNodes.count
            var currentLevel = Dictionary<Position,[Int]>()
            for _ in 0..<length {
                let annotatedNode = annotatedNodes.removeFirst()
                let node = annotatedNode.node
                let position = annotatedNode.position
                result[position.x - minX].append((node?.val)!)
                if nil == currentLevel[position] {
                    currentLevel[position] = [(node?.val)!]
                } else {
                    currentLevel[position]?.append((node?.val)!)
                }
                if nil != node?.left {
                    let posX = position.x - 1
                    if posX < minX {
                        minX = posX
                        result.insert([Int](), at: 0)
                    }
                    let posY = position.y - 1
                    if posY < minY {
                        minY = posY
                    }
                    annotatedNodes.append(AnnotatedNode(node?.left,posX,posY))
                }
                if nil != node?.right {
                    let posX = position.x + 1
                    if posX > maxX {
                        maxX = posX
                        result.append([Int]())
                    }
                    let posY = position.y - 1
                    if posY < minY {
                        minY = posY
                    }
                    annotatedNodes.append(AnnotatedNode(node?.right,posX,posY))
                }
            }
            let temp = currentLevel.filter { (arg0) -> Bool in
                let (_, value) = arg0
                return value.count > 1
            }
            for (position,values) in temp {
                let x = position.x - minX
                var currentValues = values
                currentValues.sort()
                var maxIndex = -1
                for value in currentValues {
                    let index = result[x].firstIndex(of: value)!
                    if index > maxIndex {
                        maxIndex = index
                    }
                }
                result[x].replaceSubrange((maxIndex - values.count - 1)...maxIndex, with: currentValues)
            }
        }
        return result
    }
}

