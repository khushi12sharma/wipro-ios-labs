import UIKit

enum AssessmentAppSetup {

    static func makeRootViewController() -> UIViewController {
        let navigationController = UINavigationController(
            rootViewController: AssessmentViewController()
        )

        return navigationController
    }
}
