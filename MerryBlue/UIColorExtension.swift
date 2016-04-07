extension UIColor {

    static func hexFrom(hex: String, alpha: Float = 1.0) -> UIColor {
        let hexStr = hex.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: hexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
        } else {
            print("invalid hex string")
            return UIColor.whiteColor()
        }
    }

}