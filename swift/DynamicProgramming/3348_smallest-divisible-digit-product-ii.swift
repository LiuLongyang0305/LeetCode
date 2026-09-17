//https://leetcode.cn/problems/smallest-divisible-digit-product-ii/
class Solution {
    struct MemoKey: Hashable {
        var idx: Int
        var remainT:Int
        var flag: Bool
    }
    func smallestNumber(_ num: String, _ t: Int) -> String {

        guard check(t) else {return "-1"}
        var s = [Int](repeating: 0, count: 50) + num.map({ Int($0.asciiValue!) - 48})
        var res = [Int]()
        let N = s.count
        var memo = [MemoKey:Bool]()
        func dfs(_ i: Int, _ remainT: Int,_ flag:Bool) -> Bool {
            if i == N {
                return remainT == 1
            }
            let key = MemoKey(idx: i, remainT: remainT, flag: flag)
            if let v = memo[key] {
                return v
            }
            let w = s[i]
            let start = flag ? 1 : (w == 0 ? (i < 50 ? 0 : 1) : w )
            for nw in stride(from: start, to: 10, by: 1) {
                res.append(nw)
                let nt = nw == 0 ? remainT : ( remainT /  _gcd(nw,remainT))
                let nFlag =  flag || (nw > w)
                if dfs(i + 1,nt,nFlag) {
                    memo[key] = true
                    return true
                } else {
                    let _ = res.popLast()
                }
            }
            memo[key] = false
            return false
        }
        var sb = ""
        let _ = dfs(0, t, false)
        for i in 0..<res.count {
            if res[i] > 0 {
                sb += "\(res[i])"
            }
        }
        return sb
    }
    private func check(_ num:Int) -> Bool {
        var t = num
        for pf in [2,3,5,7] {
            while t % pf == 0 {
                t /= pf
            }
        }

        return t == 1
    }
    private func _gcd(_ a: Int, _ b: Int) -> Int {
        return 0 == b ? a : _gcd(b, a % b)
    }
}
