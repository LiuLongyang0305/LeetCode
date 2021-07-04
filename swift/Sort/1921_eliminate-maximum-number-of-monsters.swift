// https://leetcode.com/problems/eliminate-maximum-number-of-monsters/
struct Fraction: Comparable {
    static func < (lhs: Fraction, rhs: Fraction) -> Bool {
        return lhs.numerator * rhs.denominator < lhs.denominator * rhs.numerator
    }
    
    //分母
    var denominator: Int
    //分子
    var numerator: Int
    mutating func addOne() {
        numerator += 1
    }
}

class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let N = dist.count
        var arrivedTime = Array<Fraction>()
        (0..<N).forEach { arrivedTime.append(Fraction(denominator: speed[$0], numerator: dist[$0]))}
        arrivedTime.sort()
        
        var ans = 0
        var time = Fraction(denominator: 1, numerator: 0)
        for at in arrivedTime {
            guard at > time else {
                break
            }
            ans += 1
            time.addOne()
        }
        return ans
    }
}




//Heap
import CoreFoundation

extension CFBinaryHeap {
    static func getMinHeapOfTime() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a, b, _ in

            let t1 = a!.load(as: Double.self)
            let t2 = b!.load(as: Double.self)

            return t1 == t2 ? .compareEqualTo : (t1 < t2 ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}

class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let minHeap = CFBinaryHeap.getMinHeapOfTime()
        var pointer: UnsafeMutablePointer<Double> = .allocate(capacity: 1)
        for idx in 0..<dist.count {
            pointer = .allocate(capacity: 1)
            pointer.initialize(to: Double(dist[idx]) / Double(speed[idx]))
            CFBinaryHeapAddValue(minHeap, pointer)
        }
        var time = 0.0
        var ans = 0
        while CFBinaryHeapGetCount(minHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: Double.self)
            guard top > time else {
                break
            }
            ans += 1
            time += 1.0
            CFBinaryHeapRemoveMinimumValue(minHeap)
        }
        pointer.deallocate()
        CFBinaryHeapRemoveAllValues(minHeap)
        return ans
    }
}