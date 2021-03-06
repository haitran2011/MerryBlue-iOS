
import UIKit
class ConfigService {

    static let sharedInstance = ConfigService()
    fileprivate let userDefaults = UserDefaults.standard

    func selectOrderType(_ userID: String) -> HomeViewOrderType {
        guard let typeRaw = self.userDefaults.object(forKey: forKeyUser(UserDefaultsKey.OrderType, userID)) as? Int else {
            return HomeViewOrderType.readCountOrder
        }
        return HomeViewOrderType(rawValue: typeRaw)!
    }

    func selectImageViewModeType(_ userID: String) -> ImageViewType {
        guard let typeRaw = self.userDefaults.object(forKey: forKeyUser(UserDefaultsKey.ImageViewModeType, userID)) as? Int else {
            return ImageViewType.excludeRT
        }
        return ImageViewType(rawValue: typeRaw)!
    }

    func selectInfoModeType(_ userID: String) -> Bool {
        guard let typeRaw = self.userDefaults.object(forKey: forKeyUser(UserDefaultsKey.ImageInfoModeType, userID)) as? Bool else {
            return false
        }
        return typeRaw
    }

    func updateOrderType(_ userID: String, type: HomeViewOrderType) {
        self.userDefaults.set(type.rawValue, forKey: forKeyUser(UserDefaultsKey.OrderType, userID))
        self.userDefaults.synchronize()
    }

    func updateImageViewModeType(_ userID: String, type: ImageViewType) {
        self.userDefaults.set(type.rawValue, forKey: forKeyUser(UserDefaultsKey.ImageViewModeType, userID))
        self.userDefaults.synchronize()
    }

    func updateImageInfoModeType(_ userID: String, type: Bool) {
        self.userDefaults.set(type, forKey: forKeyUser(UserDefaultsKey.ImageInfoModeType, userID))
        self.userDefaults.synchronize()
    }

    func forKeyUser(_ keys: String...) -> String {
        return ([TwitterManager.getUserID()] + keys).joined(separator: UserDefaultsKey.KeySeparator)
    }

}
