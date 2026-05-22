//https://leetcode.cn/problems/two-letter-card-game/
class Solution {
    func score(_ cards: [String], _ x: Character) -> Int {
        var firstEqualX = [String:Int]()
        var secondEqualX = [String:Int]()
        var xxCnt = 0
        let twoX = "\(x)\(x)"
        for card in cards {
            guard card.contains(where: {$0 == x}) else {continue}
            if card == twoX {
                xxCnt += 1
                continue
            }
            if card.first! == x {
                firstEqualX[card,default: 0] += 1
            } else {
                secondEqualX[card,default: 0] += 1
            }
        }

        //保证配对到不同的卡片
        func getMatchPairsCnt(_ counter: [String:Int]) -> Int {
            guard counter.count > 1 else {return 0}
            let totalCnt = counter.values.reduce(0) { $0 + $1}
            let maxCnt = counter.values.max()!
            let othersCnt = totalCnt - maxCnt
            return  maxCnt > totalCnt / 2 ? othersCnt : (totalCnt / 2)
        }


        func cal(_ addFirst: Int, _ addSecond: Int) -> Int {
            firstEqualX[twoX] = addFirst
            secondEqualX[twoX] = addSecond
            let sb =  getMatchPairsCnt(firstEqualX) + getMatchPairsCnt(secondEqualX)
            firstEqualX.removeValue(forKey: twoX)
            secondEqualX.removeValue(forKey: twoX)
            return sb
        }

        //分派twoX到第一组或者第二组
        var sb = 0
        for x in 0...xxCnt {
            sb = max(sb,cal(x, xxCnt - x))
        }
        return sb
    }
}
