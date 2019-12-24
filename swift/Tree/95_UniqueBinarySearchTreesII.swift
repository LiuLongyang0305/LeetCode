//https://leetcode.com/problems/unique-binary-search-trees-ii/
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

 
 //Recursion && memorize
 class Solution1 {
     struct TreeInfo: Hashable{
        var from: Int
        var to: Int
    }
    private var memo = [TreeInfo:[TreeNode?]]()
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n != 0 else {
            return []
        }
        return recursion(TreeInfo(from: 1, to: n))
    }
    
    private func recursion(_ info: TreeInfo) -> [TreeNode?] {
        if let  roots = memo[info]  {
            return roots
        }

        guard info.to > info.from else {
            var ans: [TreeNode?] = [nil]
            if info.from == info.to {
                ans[0] = TreeNode(info.from)
            }
            memo[info] = ans
            return ans
        }


        guard info.to - info.from > 1 else {
            let root1 = TreeNode(info.from)
            root1.right = TreeNode(info.to)
            let root2 = TreeNode(info.to)
            root2.left = TreeNode(info.from)
            let ans =  [root1,root2]
            memo[info] = ans
            return ans
        }
        var ans = [TreeNode?]()
        for val in info.from...info.to {
            let leftChildren: [TreeNode?] = recursion(TreeInfo(from: info.from, to: val - 1))
            let rightChildren: [TreeNode?] = recursion(TreeInfo(from: val + 1, to: info.to))
            for left in leftChildren {
                for right in rightChildren {
                    let root = TreeNode(val)
                    root.left = left
                    root.right = right
                    ans.append(root)
                }
            }
        }
        memo[info] = ans
        return ans
    }
 }
 
 //recursion
 class Solution2 {
    private struct TreeInfo{
        var from: Int
        var to: Int
    }
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n != 0 else {
            return []
        }
        return recursion(TreeInfo(from: 1, to: n))
    }
    
    private func recursion(_ info: TreeInfo) -> [TreeNode?] {
        guard info.from <= info.to else {
            return [nil]
        }
        guard info.from != info.to else {
            return [TreeNode(info.from)]
        }

        guard info.to - info.from > 1 else {
            let root1 = TreeNode(info.from)
            root1.right = TreeNode(info.to)
            let root2 = TreeNode(info.to)
            root2.left = TreeNode(info.from)
            return [root1,root2]
        }
        var ans = [TreeNode?]()
        for val in info.from...info.to {
            let leftChildren: [TreeNode?] = recursion(TreeInfo(from: info.from, to: val - 1))
            let rightChildren: [TreeNode?] = recursion(TreeInfo(from: val + 1, to: info.to))
            for left in leftChildren {
                for right in rightChildren {
                    let root = TreeNode(val)
                    root.left = left
                    root.right = right
                    ans.append(root)
                }
            }
        }
        return ans
    }
 }

 //Recursion && memorize
 class Solution {
     func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n != 0 else {
            return []
        }
        var memmo = [String:[TreeNode?]]()
        return recursion(1, n, &memmo)
     }
    private func recursion(_ start: Int, _ end: Int,  _ memo: inout  [String:[TreeNode?]] ) -> [TreeNode?] {
        guard start <= end else {
            return  [nil]
        }
        let key = "\(start)-\(end)"
        if let roots = memo[key] {
            return roots
        }
        var ans = [TreeNode?]()
        for val in start...end {
            let leftChildren = recursion(start, val - 1, &memo)
            let rightChildren = recursion(val + 1, end, &memo)
            for left in leftChildren {
                for right in rightChildren {
                    let root =  TreeNode(val)
                    root.left  = left
                    root.right = right
                    ans.append(root)
                }
            }
        }
        memo[key] = ans
        return ans
    }
 }
