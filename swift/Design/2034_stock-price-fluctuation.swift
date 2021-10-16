// https://leetcode.com/problems/stock-price-fluctuation/
import CoreFoundation

struct State {
    var time: Int
    var price: Int
}

extension CFBinaryHeap {
    public static func getMaxHeapOfState() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare  = { a,b,_ in
            let x = a!.load(as: State.self)
            let y = b!.load(as: State.self)
            return x.price == y.price ? .compareEqualTo : (x.price < y.price ? .compareGreaterThan : .compareLessThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
    public static func getMinHeapOfState() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare  = { a,b,_ in
            let x = a!.load(as: State.self)
            let y = b!.load(as: State.self)
            return x.price == y.price ? .compareEqualTo : (x.price < y.price ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}



class StockPrice {
    
    
    private let maxHeap = CFBinaryHeap.getMaxHeapOfState()
    private let minHeap = CFBinaryHeap.getMinHeapOfState()
    private var map = [Int:Int]()
    private var latestTime = -1
    
    
    private var maxHeapPointer: UnsafeMutablePointer<State> = .allocate(capacity: 1)
    private var minHeapPointer: UnsafeMutablePointer<State> = .allocate(capacity: 1)
    init() {
        
    }
    func update(_ timestamp: Int, _ price: Int) {
        map[timestamp, default: 0] = price
        latestTime = max(timestamp,latestTime)
        let s = State(time: timestamp, price: price)
        maxHeapPointer = .allocate(capacity: 1)
        maxHeapPointer.initialize(to: s)
        CFBinaryHeapAddValue(maxHeap, maxHeapPointer)
        minHeapPointer = .allocate(capacity: 1)
        minHeapPointer.initialize(to: s)
        CFBinaryHeapAddValue(minHeap, minHeapPointer)
    }
    
    func current() -> Int {
        return map[latestTime]!
    }
    
    func maximum() -> Int {
        while true {
            let top = CFBinaryHeapGetMinimum(maxHeap).load(as: State.self)
            if map[top.time]! == top.price {
                return top.price
            } else {
                CFBinaryHeapRemoveMinimumValue(maxHeap)
            }
        }
//        return 0
    }
    
    func minimum() -> Int {
        while true {
            let top = CFBinaryHeapGetMinimum(minHeap).load(as: State.self)
            if map[top.time]! == top.price {
                return top.price
            } else {
                CFBinaryHeapRemoveMinimumValue(minHeap)
            }
        }
//        return 0
    }
}


class StockPrice {
    private var map = [Int:Int]()
    private var latestTime = -1
    private typealias _StockPrice = (time:Int,price:Int)
    private var stockPrices = [_StockPrice]()
    private let INF = 1_000_000_005
    init() {
        stockPrices.append((-1,-INF))
        stockPrices.append((-1,INF))
    }
    
    func update(_ timestamp: Int, _ price: Int) {
        latestTime = max(latestTime,timestamp)
        map[timestamp] = price
        insert((timestamp,price))
    }
    
    func current() -> Int {
        return map[latestTime]!
    }
    
    func maximum() -> Int {
        while true {
            let idx = stockPrices.count - 2
            if map[stockPrices[idx].time] == stockPrices[idx].price {
                return stockPrices[idx].price
            }
            stockPrices.remove(at: idx)
        }
    }
    
    func minimum() -> Int {
        while true {
            if map[stockPrices[1].time] == stockPrices[1].price {
                return stockPrices[1].price
            }
            stockPrices.remove(at: 1)
        }
    }
    
    private func insert(_ val: _StockPrice ) {
        var left = 0
        var right = stockPrices.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if stockPrices[mid].price >= val.price {
                right = mid
            } else {
                left = mid + 1
            }
        }
        stockPrices.insert(val, at: left)
    }
}
/**
 * Your StockPrice object will be instantiated and called as such:
 * let obj = StockPrice()
 * obj.update(timestamp, price)
 * let ret_2: Int = obj.current()
 * let ret_3: Int = obj.maximum()
 * let ret_4: Int = obj.minimum()
 */