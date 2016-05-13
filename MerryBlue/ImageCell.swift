import UIKit

class ImageCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

}
