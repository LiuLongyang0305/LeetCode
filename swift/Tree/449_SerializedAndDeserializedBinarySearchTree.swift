//https://leetcode.com/problems/serialize-and-deserialize-bst/
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



class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        guard let r = root else {
            return ""
        }
        var ans = "\(r.val)"
        ans += "(" + serialize(r.left) + ")"
        ans += "(" + serialize(r.right) + ")"
        return ans
    }
    
    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        return str2tree(data)
    }
    
    private func str2tree(_ s: String) -> TreeNode? {
        guard !s.isEmpty else {
            return nil
        }
        if let index = s.firstIndex(of: "(") {
            let num = Int(s[s.startIndex..<index])!
            let root = TreeNode(num)
            var level = 1
            var temp = s.index(after: index)
            while temp != s.endIndex && level > 0 {
                if s[temp] == "(" {
                    level += 1
                } else if s[temp] == ")" {
                    level -= 1
                    if level == 0 {
                        break
                    }
                }
                temp = s.index(after: temp)
            }
            if s.distance(from: index, to: temp) > 1 {
                root.left = str2tree(String(s[s.index(after: index)..<temp]))
            }
            let rightSratrIndex = s.index(after: temp)
            let rightEnd = s.index(before: s.endIndex)
            if s.distance(from: rightSratrIndex, to: rightEnd) > 1 {
                root.right = str2tree(String(s[s.index(after: rightSratrIndex)..<rightEnd ]))
            }
            return root
        }
        return nil
    }
}
