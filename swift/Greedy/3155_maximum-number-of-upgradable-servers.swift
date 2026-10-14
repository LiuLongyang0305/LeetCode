//https://leetcode.cn/problems/maximum-number-of-upgradable-servers/
class Solution {
    func maxUpgrades(_ count: [Int], _ upgrade: [Int], _ sell: [Int], _ money: [Int]) -> [Int] {
        let M = count.count
        var sb = [Int](repeating: 0, count: M)
        for i in 0..<M {
            let (c,uc,sm,m) = (count[i],upgrade[i],sell[i],money[i])
            let t1 = c * uc - m
            let t2 = sm + uc
            var x = t1 / t2
            let remain = t1 % t2
            if remain > 0 {
                x += 1
            }
            sb[i] = min(c,max(0,c - x))
        }
        return sb
    }
}
