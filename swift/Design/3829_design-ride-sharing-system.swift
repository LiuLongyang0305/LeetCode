// https://leetcode.cn/problems/design-ride-sharing-system
    class RideSharingSystem {
        private var riders = [Int]()
        private var drivers = [Int]()
        private var waitingRiders = Set<Int>()
        init() {

        }

        func addRider(_ riderId: Int) {
            riders.append(riderId)
            waitingRiders.insert(riderId)
        }

        func addDriver(_ driverId: Int) {
            drivers.append(driverId)
        }

        func matchDriverWithRider() -> [Int] {
            while let f = riders.first, !waitingRiders.contains(f) {
                riders.removeFirst()
            }
            if let rf = riders.first, let rd = drivers.first {
                riders.removeFirst()
                drivers.removeFirst()
                return [rd,rf]
            } else {
                return [-1,-1]
            }
        }

        func cancelRider(_ riderId: Int) {
            waitingRiders.remove(riderId)
        }
    }
