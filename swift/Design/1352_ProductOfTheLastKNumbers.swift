// https://leetcode.com/problems/product-of-the-last-k-numbers/
class ProductOfNumbers {
    private typealias Counter = [Int:Int]
    private var counters = [Counter]()
    private var currentCounter: Counter = [:]
    //    private var products: [Int] = [1]
    private var indexOfZero = -1
    init() {
        counters.append([:])
    }
    
    func add(_ num: Int) {
        currentCounter.updateValue((currentCounter[num] ?? 0) + 1, forKey: num)
        counters.append(currentCounter)
    }
    
    func getProduct(_ k: Int) -> Int {
//        print(counters)
        var ans = 1
        var targetCoiunter = currentCounter
        for (key,val) in counters[counters.count - k - 1] {
            if let v = targetCoiunter[key] {
                if v == val {
                    targetCoiunter.removeValue(forKey: key)
                } else {
                    targetCoiunter[key] = v - val
                }
            }
        }
        guard nil == targetCoiunter[0] else {
            return 0
        }
        for (key,val) in targetCoiunter {
            if key >= 2 {
                ans *= Int(pow(Double(key), Double(val)) )
            }
        }
        return ans
    }
 }

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */