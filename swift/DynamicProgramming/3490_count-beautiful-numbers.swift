// https://leetcode.com/problems/count-beautiful-numbers/
class Solution {
    struct KeyNode: Hashable {
        var pos: Int
        var isLessThan: Bool
        var curP: Int
        var curS: Int
    }
    func beautifulNumbers(_ l: Int, _ r: Int) -> Int {
        return  cal(r + 1) - cal(l)
    }
    
    private func cal(_ maxNum: Int) -> Int {

        let digitsLimit = getDigits(of: maxNum)
        let N = digitsLimit.count
        var memo = [KeyNode:Int]()

        func dfs(_ pos: Int, _ isLessThan: Bool, _ curP: Int, _ curS: Int) -> Int {
            guard pos < N else {
                if curS == 0 {return 0}
                return (curP % curS == 0 && isLessThan) ? 1 : 0
            }
            
            let key = KeyNode(pos: pos, isLessThan: isLessThan, curP: curP, curS: curS)
            if let sb = memo[key] {
                return sb
            }
            let high = isLessThan ? 9 : digitsLimit[pos]
            var sb = 0
            for d in 0...high {
                sb += dfs(pos + 1, isLessThan || d < digitsLimit[pos], curS + d == 0 ? 1 : (curP * d), curS + d)
            }
            memo[key] = sb
            return sb
        }
        
        
        return  dfs(0, false, 1,0)
    }
    
    private func getDigits(of num: Int) -> [Int] {
        var sb = [Int]()
        var t = num
        while t > 0 {
            sb.append(t % 10)
            t /= 10
        }
        return [Int](sb.reversed())
    }
}
