// https://leetcode.com/problems/serialize-and-deserialize-n-ary-tree/
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
class Codec {
    func serialize(_ root: Node?) -> String {
        guard let r = root else {
            return ""
        }
        guard !r.children.isEmpty else {
            return "\(r.val)[]"
        }
        var ans = "\(r.val)["
        
        for child in r.children {
            ans.append(serialize(child))
        }
        ans.append("]")
        return ans
    }
    
    func deserialize(_ data: String) -> Node? {
        guard !data.isEmpty else {
            return nil
        }
        let root = Node(-1)
        var queue: [Node] = [root]
        var cur = ""
        for ch in data {
            if ch.isNumber {
                cur.append(ch)
            } else if ch == "[" {
                if !cur.isEmpty {
                    let node = Node(Int(cur)!)
                    queue.last?.children.append(node)
                    queue.append(node)
                    cur = ""
                }
            } else if ch == "]"{
                if !cur.isEmpty {
                    let node = Node(Int(cur)!)
                    queue.last?.children.append(node)
                    cur = ""
                }
                queue.removeLast()
            }
        }
        return root.children[0]
    }
}
