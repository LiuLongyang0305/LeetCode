//https://leetcode.com/problems/numbers-with-same-consecutive-differences/
class Solution {

    typealias Pair = (first:Int,second:Int)
    private var N: Int = 0
    private var dic: [Int:Pair] = [:]
    private var ans = [Int]()
    
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {

        guard N != 1 else {
            return Array<Int>(0...9)
        }

        guard K != 0 else {
            var  firstNumber  = 0
            var rel = Array<Int>()
            for _ in 1...N {
                firstNumber = firstNumber * 10 + 1
            }
            for i in 1...9 {
                rel.append(firstNumber * i)
            }
            return rel
        }
        
        self.N = N
        self.dic = getDic(K: K)
        
        let sortedDic = dic.sorted { (dic1, dic2) -> Bool in
            dic1.key < dic2.key
        }
        for i in 1..<sortedDic.count {
            getNumberArray(sortedDic[i].key,[Int]())
        }
        return ans.sorted()
    }

    private func getDic(K: Int) -> [Int:Pair] {
        var dic = [Int:Pair]()
        for i in 0...9 {
            if i + K <= 9 || i - K >= 0 {
                if dic[i] == nil {
                    dic[i] = (-1,-1)
                }
                if i + K <= 9 {
                    dic[i]?.second = i + K
                }
                if i - K >= 0 {
                    dic[i]?.first = i - K
                }
            }
        }
        return dic
    }
    
    private func getNumberArray(_ tempVal: Int,_ tempArr: [Int]) {
        var ansCopy = tempArr
        ansCopy.append(tempVal)
        if ansCopy.count == N {
            var temp = 0
            for ele in ansCopy {
                temp = temp * 10 + ele
            }
            self.ans.append(temp)
            return
        }
        if let pair = dic[tempVal] {
            if  pair.first != -1 {
                getNumberArray(pair.first,ansCopy)
            }
            if pair.second != -1 {
                getNumberArray(pair.second,ansCopy)
            }
        }
    }
}