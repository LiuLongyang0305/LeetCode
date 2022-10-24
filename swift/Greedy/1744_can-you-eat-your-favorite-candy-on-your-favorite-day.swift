// https://leetcode.cn/problems/can-you-eat-your-favorite-candy-on-your-favorite-day/
class Solution {
    func canEat(_ candiesCount: [Int], _ queries: [[Int]]) -> [Bool] {

        var preffix = [0]
        candiesCount.forEach { preffix.append(preffix.last! + $0)}
        preffix.removeFirst()
        var ans = [Bool]()
        for query in queries {
            let (type,day,cap) = (query[0],query[1],query[2])
            let x1 = day + 1
            let y1 = (day + 1) * cap
            let x2 = type == 0 ? 1 : (preffix[type - 1] + 1)
            let y2 = preffix[type]
            ans.append(!(x1 > y2 || x2 >  y1))
        }
        return  ans
    }
}