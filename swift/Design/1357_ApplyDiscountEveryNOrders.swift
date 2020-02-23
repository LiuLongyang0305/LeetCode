// https://leetcode.com/problems/apply-discount-every-n-orders/
class Cashier {
    
    private var frequency: Int = -1
    private var discount: Int = -1
    private var products: [Int:Int] = [:]
    private var countCustomers = 0
    
    init(_ n: Int, _ discount: Int, _ products: [Int], _ prices: [Int]) {
        self.frequency = n
        self.discount = discount
        for index in 0..<products.count {
            self.products[products[index]] = prices[index]
        }
    }
    
    func getBill(_ product: [Int], _ amount: [Int]) -> Double {
        var total: Int = 0
        for index in 0..<product.count {
            total += self.products[product[index]]! * amount[index]
        }
        self.countCustomers += 1
        if  self.countCustomers == frequency {
            self.countCustomers = 0
            return Double((100 - self.discount) * total ) / 100.0
        }
        return Double(total)
    }
 }
 
/**
 * Your Cashier object will be instantiated and called as such:
 * let obj = Cashier(n, discount, products, prices)
 * let ret_1: Double = obj.getBill(product, amount)
 */