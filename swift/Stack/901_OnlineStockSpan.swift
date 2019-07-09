//https://leetcode.com/problems/online-stock-span/
//https://leetcode.com/problems/online-stock-span/
class StockSpanner {
    
    typealias Pair = (price: Int, span: Int)
    var prices = [Pair]()

    init() {
        
    }
    
    func next(_ price: Int) -> Int {
        var w = 1
        
        while !prices.isEmpty && prices.last!.price <= price {
            w += prices.popLast()!.span
        }
        prices.append((price,w))
        
        return w
    }
    
}