// https://leetcode.com/problems/lexicographical-numbers/
 class Solution1 {
    func lexicalOrder(_ n: Int) -> [Int] {
        return (1...n).map {"\($0)"}.sorted().map {Int($0)!}
    }
 }
 
 class Solution2 {
    func lexicalOrder(_ n: Int) -> [Int] {
        return Array<Int>(1...n).sorted {"\($0)" < "\($1)"}
    }
 }
 class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var ans = [Int]()
        func innerLexicalOrder(current: Int) {
            ans.append(current)
            for i in 0...9 {
                let next =  current * 10 + i
                guard next <= n else {
                    return
                }
                innerLexicalOrder(current: next)
            }
        }
        for i in 1...9 {
            if i <= n {
                innerLexicalOrder(current: i)
            }
        }
        return ans
    }
 }
