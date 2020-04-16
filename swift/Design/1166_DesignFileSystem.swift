// https://leetcode.com/problems/design-file-system/
class FileSystem1 {
    private var map: [String:Int] = [:]

    init() {
        
    }
    
    func createPath(_ path: String, _ value: Int) -> Bool {

        guard path != "/" else {
            return false
        }
        guard nil == map[path] else {
            return false
        }
        guard let lastIndexOfSlash = path.lastIndex(of: "/") else {
            return false
        }
        guard lastIndexOfSlash != path.startIndex else {
            map[path] = value
            return true
        }
        let lastLevelPath = String(path[..<lastIndexOfSlash])
        guard nil != map[lastLevelPath] else {
            return false
        }
        map[path] = value
        return true
    }
    
    func get(_ path: String) -> Int {
        return map[path] ?? -1
    }
}


class FileSystem {
    private class TreeNode {
        var dir: String
        var nextLevels = [TreeNode]()
        var val: Int
        init(_ dir: String,_ val: Int) {
            self.dir = dir
            self.val = val
        }
    }
    private let root = TreeNode("/",-1)
    init() {
        
    }
    
    func createPath(_ path: String, _ value: Int) -> Bool {
        let pathCompoments = path.split(separator: "/").map { String($0)}
        func dfs(_ root: TreeNode, _ index: Int) -> Bool {
            guard index != pathCompoments.count - 1 else {
                for child in root.nextLevels {
                    if child.dir == pathCompoments[index] {
                        return false
                    }
                }
                root.nextLevels.append(TreeNode(pathCompoments[index], value))
                return true
            }
            for child in root.nextLevels {
                if child.dir == pathCompoments[index] {
                    return dfs(child, index + 1)
                }
            }
            return false
        }
        return dfs( root, 0)
    }
    
    func get(_ path: String) -> Int {
        let pathCompoments = path.split(separator: "/").map { String($0)}
        func dfs(_ root: TreeNode, _ index: Int) -> Int {
            guard index != pathCompoments.count - 1 else {
                for child in root.nextLevels {
                    if child.dir == pathCompoments[index] {
                        return child.val
                    }
                }
                return -1
            }
            for child in root.nextLevels {
                if child.dir == pathCompoments[index] {
                    return dfs(child, index + 1)
                }
            }
            return -1
        }
        return dfs(root, 0)
    }
}

