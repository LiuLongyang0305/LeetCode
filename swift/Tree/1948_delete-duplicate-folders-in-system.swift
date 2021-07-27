// https://leetcode.com/problems/delete-duplicate-folders-in-system/
class Node {
    var name:String
    var next = [String:Node]()
    var del = false
    init(_ name: String = "") {
        self.name = name
    }
}

class Solution {
    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        func addPath(_ node: Node,_ path: [String]) {
            var curNode = node
            for cur in path {
                if curNode.next[cur] == nil {
                    curNode.next[cur] = Node(cur)
                }
                curNode = curNode.next[cur]!
            }
        }
        var seen = [String:Node]()
        func dedupe(_ node: Node) -> String {
            var subFolder = ""
            let sortedChildrenNames = node.next.keys.sorted()
            for name in sortedChildrenNames {
                subFolder += dedupe(node.next[name]!)
            }
            if !subFolder.isEmpty {
                if let existed = seen[subFolder] {
                    existed.del = true
                    node.del = true
                } else {
                    seen[subFolder] = node
                }
            }
            return "(" + node.name + subFolder + ")"
        }
        func getPath(_ path: inout [String],_ folders: inout [[String]], _ node: Node) {
            guard !node.del else {
                return
            }
            path.append(node.name)
            folders.append(path)
            for (_,next) in node.next {
                getPath(&path, &folders, next)
            }
            path.removeLast()
        }
        let root = Node()
        paths.forEach { addPath(root, $0)}
        let _ = dedupe(root)
        var ans = [[String]]()
        var path = [String]()
        for (_,next) in root.next {
            getPath(&path, &ans, next)
        }
        // print(root.next.map({ $0 + "\($1.del)"}))
        return ans
    }
}