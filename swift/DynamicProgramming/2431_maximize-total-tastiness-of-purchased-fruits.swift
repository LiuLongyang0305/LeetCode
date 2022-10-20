// https://leetcode.cn/problems/maximize-total-tastiness-of-purchased-fruits/
class Solution {
    func maxTastiness(_ price: [Int], _ tastiness: [Int], _ maxAmount: Int, _ maxCoupons: Int) -> Int {

        let N = price.count
        var memo = [Int:Int]()
        func dfs(_ idx: Int,_ ammount: Int, _ coupons: Int) -> Int{

            guard idx < N && ammount >= 0 else {
                return 0
            }
            let key = ammount << 40 | (idx << 20) | coupons
            if let t = memo[key] {
                return t
            }
            var ans = 0

            //原价买
            if ammount >= price[idx] {
                ans = max(ans, tastiness[idx] + dfs(idx + 1, ammount - price[idx], coupons))
            }

            //半价买
            let half = price[idx] / 2
            if ammount >= half && coupons > 0{
                ans = max(ans, tastiness[idx] + dfs(idx + 1, ammount - half, coupons - 1))
            }

            //不买
            ans = max(ans, dfs(idx + 1, ammount, coupons))
            memo[key] = ans
            return ans

        }


        return dfs(0, maxAmount, maxCoupons)
    }
}