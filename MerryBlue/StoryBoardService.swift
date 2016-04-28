import SlideMenuControllerSwift

class StoryBoardService {

    static let sharedInstance = StoryBoardService()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)


    func mainViewController() -> UIViewController {
        let mainView = storyboard.instantiateViewControllerWithIdentifier("main")
        let leftMenuView = storyboard.instantiateViewControllerWithIdentifier("menu")
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.hideStatusBar = false
        return SlideMenuController(mainViewController: mainView, leftMenuViewController: leftMenuView)
    }

    func signInViewController() -> UIViewController {
        return storyboard.instantiateViewControllerWithIdentifier("login")
    }

    func userView() -> UIViewController {
        return storyboard.instantiateViewControllerWithIdentifier("user-view")
    }

    func showTweetView() -> UIViewController {
        return storyboard.instantiateViewControllerWithIdentifier("show-tweet")
    }

    func navHomeViewController() -> UINavigationController {
        return (storyboard.instantiateViewControllerWithIdentifier("home-nav") as? UINavigationController)!
    }

    func photoViewController() -> PhotoViewController {
        return (storyboard.instantiateViewControllerWithIdentifier("photo-view") as? PhotoViewController)!
    }
}
