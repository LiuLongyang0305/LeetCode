// https://leetcode.com/problems/abbreviating-the-product-of-a-range/
class Solution {
    private let MOD = 100000
    private let digitsCntLimit = 18
    private let INF = 1_000_000_007
    func abbreviateProduct(_ left: Int, _ right: Int) -> String {


        let (values,zeroCnt) = caculateValuesAndZeroCnt(left, right)

        guard !values.isEmpty else {
            return "1e\(zeroCnt)"
        }

        let (pre,flag) = caculatePreffix(base: values)
        guard flag else {
            return pre + "e\(zeroCnt)"
        }
        return pre + "..." + caculateSuffix(base: values) + "e\(zeroCnt)"
    }



    private func caculateValuesAndZeroCnt(_ left: Int, _ right: Int) -> (values:[Int], zeonCnt:Int) {

        var values = [Int]()
        var twoCnt = 0
        var fiveCnt = 0
        var t = 1
        for var num in left...right {

            while num % 5 == 0 {
                fiveCnt += 1
                num /= 5
            }
            while num % 2 == 0 {
                twoCnt += 1
                num /= 2
            }
            if num > 1 {
                if t * num > INF {
                    values.append(t)
                    t = num
                } else {
                    t *= num
                }
            }
        }
        values.append(t)
        let zeroCnt = min(twoCnt, fiveCnt)
        if twoCnt > zeroCnt {
            values.append(contentsOf: getValues(twoCnt - zeroCnt, 2))
        } else if fiveCnt > zeroCnt {
            values.append(contentsOf: getValues(fiveCnt - zeroCnt, 5))
        }
        return (values,zeroCnt)
    }


    private func caculatePreffix(base values: [Int]) -> (pre:String,isLengthMoreThanFive:Bool) {

        var preffix = getDigitArray(of: values[0])
        for v in values.dropFirst() {
            preffix = multiply(first: preffix, second: getDigitArray(of: v))
        }

        let pre  = String(preffix.reversed().reduce("", {$0 + "\($1)"}))
        guard pre.count > 10 else {
            return (pre,false)
        }
        return (String(pre.prefix(5)),true)
    }

    private func caculateSuffix(base values: [Int]) -> String {

        var suffix = values[0]
        for v in values.dropFirst() {
            suffix *= v
            suffix %= MOD
        }

        var suf = "\(suffix)"

        while suf.count < 5 {
            suf.insert("0", at: suf.startIndex)
        }

        return suf
    }


    private func getDigitArray(of num: Int) -> [Int] {
        var ans = [Int]()

        var t = num
        while t > 0 {
            ans.append(t % 10)
            t /= 10
        }

        return ans
    }


    private func getValues(_ cnt: Int, _ base : Int) -> [Int] {
        var values = [Int]()
        var t = 1
        for _ in 0..<cnt {
            if t * base > INF {
                values.append(t)
                t = base
            } else {
                t *= base
            }
        }
        values.append(t)
        return values
    }

    private func multiply(first: [Int] , second: [Int])  -> [Int] {

        var ans = [Int]()

        let N = second.count

        for i in 0..<N {
            let t = (i > 0 ? [Int](repeating: 0, count: i) : [Int]()) + muliply2(first: first, second: second[i])
            ans = add(first: ans, second: t)
        }
        if ans.count > digitsCntLimit {
            ans = [Int](ans.suffix(digitsCntLimit))
        }
        return ans
    }

     private func add(first: [Int] , second: [Int]) -> [Int] {
        guard !first.isEmpty else {return second}
        guard !second.isEmpty else {return first}
        var ans = [Int]()
        var carry = 0

        let M = first.count
        let N = second.count

        let P = max(M, N)
        for i in 0..<P {
            let t = (i < M ? first[i] : 0) + (i < N ? second[i] : 0) + carry
            ans.append(t % 10)
            carry = t / 10
        }
        if carry > 0 {
            ans.append(carry)
        }
        return ans
    }


    private func muliply2( first: [Int], second: Int ) -> [Int] {
        guard second > 0 else {return []}
        var ans = [Int]()
        var carry = 0
        for num in first {
            let t = num * second + carry
            ans.append(t % 10)
            carry = t / 10
        }
        if carry > 0 {
            ans.append(carry)
        }
        return ans
    }
}