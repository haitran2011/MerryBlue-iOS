import UIKit
import TwitterKit

class ProfileViewController: UIViewController {
    
    private var logoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setLogoutButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    internal func onClickLogoutButton(sender: UIButton) {
        let store = Twitter.sharedInstance().sessionStore
        if let userID = store.session()!.userID {
            store.logOutUserID(userID)
        }
        self.presentViewController(SignInViewController(), animated: true, completion: nil)
    }
    
    private func setLogoutButton() {
        logoutButton = UIButton()
        logoutButton.setTitle("ログアウト", forState: UIControlState.Normal)
        logoutButton.addTarget(self, action: "onClickLogoutButton:", forControlEvents: .TouchUpInside)
        logoutButton.frame = CGRectMake(0, 0, 200, 40)
        logoutButton.backgroundColor = UIColor.grayColor()
        logoutButton.layer.cornerRadius = 10.0
        logoutButton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height - 100)
        self.view.addSubview(logoutButton)
    }
}

