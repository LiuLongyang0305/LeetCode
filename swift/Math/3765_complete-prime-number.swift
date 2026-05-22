    // https://leetcode.cn/problems/complete-prime-number/
class Solution {
    let powTen = [1,10,100,1000,10000,100000,1000000,10000000,1000000000,10000000000]
    func completePrime(_ num: Int) -> Bool {

        let M = String(num).count
            //前缀和后缀
        for i in 0..<M {
            guard isPrimer(num / powTen[i]) else {return false}
            guard isPrimer(num % powTen[i]) else {return false}
        }



        return true
    }

    private func isPrimer(_ num: Int) -> Bool {
        // print("num = \(num)")
        guard num > 0 else {return true}
        let limit = Int(sqrt(Double(num))) + 1
        if limit > 2 {
            for i in 2...limit {
                guard num % i != 0 else {return false}
            }
        }

        return num >= 2
    }
}
