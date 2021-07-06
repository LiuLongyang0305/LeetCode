 // https://leetcode.com/problems/number-of-orders-in-the-backlog/
import CoreFoundation

struct BuyOrder: Comparable {
    static func < (lhs: BuyOrder, rhs: BuyOrder) -> Bool {
        return lhs.price > rhs.price
    }
    
    var price: Int
    var ammount: Int
    
}
struct SellOrder: Comparable {
    static func < (lhs: SellOrder, rhs: SellOrder) -> Bool {
        return lhs.price < rhs.price
    }
    var price: Int
    var ammount: Int
    
}
extension CFBinaryHeap {
    static func getMinHeapOfSellOrder() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a,b,_ in
            let order1 = a!.load(as: SellOrder.self)
            let order2 = b!.load(as: SellOrder.self)
            return order1 == order2 ? .compareEqualTo : (order1 < order2 ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
    static func getMaxHeapOfBuyOrder() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks.init()
        callbacks.compare = { a,b,_ in
            let order1 = a!.load(as: BuyOrder.self)
            let order2 = b!.load(as: BuyOrder.self)
            return order1 == order2 ? .compareEqualTo : (order1 < order2 ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}



class Solution {
    private let MOD = 1_000_000_007
    func getNumberOfBacklogOrders(_ orders: [[Int]]) -> Int {
        
        var pointerOfBuyOrder: UnsafeMutablePointer<BuyOrder> = .allocate(capacity: 1)
        var pointerOfSellOrder: UnsafeMutablePointer<SellOrder> = .allocate(capacity: 1)
        let buyOrderHeap = CFBinaryHeap.getMaxHeapOfBuyOrder()
        let sellOrderHeap = CFBinaryHeap.getMinHeapOfSellOrder()
        
        defer {
            pointerOfBuyOrder.deallocate()
            pointerOfSellOrder.deallocate()
        }
        for order in orders {
            let price = order[0]
            var ammount = order[1]
            if order[2] == 0 {
                //buy order
                
                while ammount > 0 && CFBinaryHeapGetCount(sellOrderHeap) > 0 {
                    var minPriceSellOrder = CFBinaryHeapGetMinimum(sellOrderHeap).load(as: SellOrder.self)
                    guard minPriceSellOrder.price <= price else {
                        break
                    }
                    CFBinaryHeapRemoveMinimumValue(sellOrderHeap)
                    if minPriceSellOrder.ammount <= ammount {
                        ammount -= minPriceSellOrder.ammount
                    } else {
                        minPriceSellOrder.ammount -= ammount
                        ammount = 0
                        pointerOfSellOrder = .allocate(capacity: 1)
                        pointerOfSellOrder.initialize(to: minPriceSellOrder)
                        CFBinaryHeapAddValue(sellOrderHeap, pointerOfSellOrder)
                    }
                }
                
                if ammount > 0 {
                    let buyOrder = BuyOrder(price: price, ammount: ammount)
                    pointerOfBuyOrder = .allocate(capacity: 1)
                    pointerOfBuyOrder.initialize(to: buyOrder)
                    CFBinaryHeapAddValue(buyOrderHeap, pointerOfBuyOrder)
                }
            } else {
                //Sell order
                while ammount > 0 && CFBinaryHeapGetCount(buyOrderHeap) > 0 {
                    var maxPriceBuyOrder = CFBinaryHeapGetMinimum(buyOrderHeap).load(as: BuyOrder.self)
                    guard maxPriceBuyOrder.price >= price else {
                        break
                    }
                    CFBinaryHeapRemoveMinimumValue(buyOrderHeap)
                    if maxPriceBuyOrder.ammount <= ammount {
                        ammount -= maxPriceBuyOrder.ammount
                    } else {
                        maxPriceBuyOrder.ammount -= ammount
                        ammount = 0
                        pointerOfBuyOrder = .allocate(capacity: 1)
                        pointerOfBuyOrder.initialize(to: maxPriceBuyOrder)
                        CFBinaryHeapAddValue(buyOrderHeap, pointerOfBuyOrder)
                    }
                }
                
                if ammount > 0 {
                    let sellOrder = SellOrder(price: price, ammount: ammount)
                    pointerOfSellOrder = .allocate(capacity: 1)
                    pointerOfSellOrder.initialize(to: sellOrder)
                    CFBinaryHeapAddValue(sellOrderHeap, pointerOfSellOrder)
                }
            }
        }
        var ans = 0
        
        while CFBinaryHeapGetCount(sellOrderHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(sellOrderHeap).load(as: SellOrder.self)
            CFBinaryHeapRemoveMinimumValue(sellOrderHeap)
            ans += top.ammount
            ans %= MOD
        }
        while CFBinaryHeapGetCount(buyOrderHeap) > 0 {
            let top = CFBinaryHeapGetMinimum(buyOrderHeap).load(as: BuyOrder.self)
            CFBinaryHeapRemoveMinimumValue(buyOrderHeap)
            ans += top.ammount
            ans %= MOD
        }
        
        return ans % MOD
    }
}


