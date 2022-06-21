// https://leetcode.com/problems/allocate-mailboxes/
class Solution {
    func minDistance(_ houses: [Int], _ k: Int) -> Int {

        let sortedHouses = houses.sorted()
        let M = houses.count

        ///在*left...right*之间仅放置一个邮箱的最小距离之和
        func getDis(_ left: Int,_ right: Int) -> Int {
            var ans = 0
            var i = left
            var j = right

            while i < j {
                ans += sortedHouses[j] - sortedHouses[i]
                i += 1
                j -= 1
            }
            return ans
        }



        var memo = [Int:Int]()

        ///搜索所有可能
        func dfs(_ startHouse: Int,_ mailBoxCnt: Int) -> Int {
            let remainHouse = M - startHouse
            guard remainHouse > mailBoxCnt else {
                return 0
            }
            guard mailBoxCnt > 0 else {
                return Int.max
            }
            guard startHouse < M else {return 0}
            let key = (startHouse << 10) | mailBoxCnt
            if let c = memo[key] {
                return c
            }

            var ans = Int.max
            ///枚举结束的房间*idx*
            var endHouse = startHouse
            while endHouse < M {
                let t = dfs(endHouse + 1, mailBoxCnt - 1)
                if Int.max != t {
                    ans = min(ans, getDis(startHouse, endHouse) + t)
                }
                endHouse += 1
            }
            memo[key] = ans

            return ans
        }

        return dfs(0, k)
    }
}