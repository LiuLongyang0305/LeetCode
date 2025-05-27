// https://leetcode.cn/problems/find-the-maximum-number-of-elements-in-subset/
class Solution {
    private let powerOfTwo = (0...30).map { 1 << $0}
    func maximumLength(_ nums: [Int]) -> Int {
        var counter = [Int:Int]()
        for num in nums {
            counter[num,default: 0] += 1
        }
        var ans = 1
        if let c = counter[1] {
            ans = c - 1 + (c & 1)
        }
        let sortedKeys = counter.keys.sorted()
        let maxVal = nums.max()!
        for startVal in sortedKeys {
            if startVal == 1 {continue}
            let maxK = getMaxSequenceLength(startVal, maxVal)
            // print("\(startVal)  maxK = \(maxK)")
            if maxK < 2 {continue}

            for length in stride(from: 2, through: maxK, by: 2).reversed() {
                let (f,c) = check(buildArrAndCounter(startVal, length), in: counter)
                if f {
                    ans = max(ans, c)
                    break
                }
            }

        }


        return ans
    }

    private func getMaxSequenceLength(_ num: Int,_ limit: Int) -> Int {
        return Int(log2(Double(limit)) / log2(Double(num)))
    }


    private func buildArrAndCounter(_ num: Int, _ curK: Int) -> [Int:Int] {
        var ans = [Int:Int]()

        ans[power(num, curK),default: 0] += 1

        var t = curK / 2
        while t > 0 {
            ans[power(num, t )] = 2
            t /= 2
        }

        // print("\(num) \(curK) \(ans)")
        return ans
    }


    private func  power(_ num: Int, _ exp: Int) -> Int {
        if exp == 0 {return 1}
        let powerHalf = power(num, exp >> 1)
        if exp & 1 == 0 {
            return powerHalf * powerHalf
        } else {

            return powerHalf * powerHalf * num
        }
    }


    private func check(_ counter:[Int:Int], in arrCounter: [Int:Int]) -> (Bool,Int) {

        for (num,cnt) in counter {
            if let c2 = arrCounter[num], c2 >= cnt {
                continue
            }
            return (false,-1)
        }


        return (true,counter.values.reduce(0,{$0 + $1}))
    }

}
