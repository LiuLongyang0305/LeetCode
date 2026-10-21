// https://leetcode.cn/problems/design-order-management-system/
    class OrderManagementSystem {

        private typealias TypeAndPrice = (type:String,price:Int)
        private var orderIdToInfo = [Int:TypeAndPrice]()
        private var typeToPriceToIds = [String:[Int:Set<Int>]]()
        init() {

        }

        func addOrder(_ orderId: Int, _ orderType: String, _ price: Int) {
            orderIdToInfo[orderId] = (orderType,price)
            typeToPriceToIds[orderType,default: [:]][price,default: []].insert(orderId)
        }

        func modifyOrder(_ orderId: Int, _ newPrice: Int) {
            let info = orderIdToInfo[orderId]!
            orderIdToInfo[orderId,default: ("",-1)].price = newPrice
            typeToPriceToIds[info.type,default: [:]][info.price,default: []].remove(orderId)
            typeToPriceToIds[info.type,default: [:]][newPrice,default: []].insert(orderId)
        }

        func cancelOrder(_ orderId: Int) {
            guard let info = orderIdToInfo[orderId] else {return}
            orderIdToInfo.removeValue(forKey: orderId)
            typeToPriceToIds[info.type,default: [:]][info.price,default: []].remove(orderId)
        }

        func getOrdersAtPrice(_ orderType: String, _ price: Int) -> [Int] {
            if let ids = typeToPriceToIds[orderType]?[price] {
                return [Int](ids)
            }
            return   []
        }
    }


/**
 * Your OrderManagementSystem object will be instantiated and called as such:
 * let obj = OrderManagementSystem()
 * obj.addOrder(orderId, orderType, price)
 * obj.modifyOrder(orderId, newPrice)
 * obj.cancelOrder(orderId)
 * let ret_4: [Int] = obj.getOrdersAtPrice(orderType, price)
 */
