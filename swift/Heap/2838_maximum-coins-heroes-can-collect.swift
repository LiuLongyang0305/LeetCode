    // https://leetcode.cn/problems/maximum-coins-heroes-can-collect/
    class Solution {
        struct Monster:Comparable {
            static func < (lhs: Solution.Monster, rhs: Solution.Monster) -> Bool {
                lhs.energy < rhs.energy
            }
            
            var energy:Int
            var coin: Int

        }
        func maximumCoins(_ heroes: [Int], _ monsters: [Int], _ coins: [Int]) -> [Int] {
            let HM = heroes.count
            let MM = monsters.count
            var ans = [Int](repeating: 0, count: HM)
            let sortedHeroIndex = (0..<HM).sorted { heroes[$0] > heroes[$1]}
            var curRemain = coins.reduce(0) { $0 + $1}
            var heap = Heap<Monster>()
            for i in 0..<MM {
                heap.insert(Monster(energy: monsters[i], coin: coins[i]))
            }
            for heroIdx in sortedHeroIndex {
                let cap = heroes[heroIdx]
                while let maxMonster = heap.max, maxMonster.energy > cap {
                    curRemain -= maxMonster.coin
                    let _ = heap.popMax()
                }
                ans[heroIdx] = curRemain
            }

            return ans
        }
    }
