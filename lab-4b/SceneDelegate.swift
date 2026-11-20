
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        LifecycleLogger.log("Scene: willConnect")

        guard let windowScene = scene as? UIWindowScene else {
            return
        }

        let firstVC = FirstViewController()
        let navigationController = UINavigationController(
            rootViewController: firstVC
        )

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        LifecycleLogger.log("Scene: didBecomeActive")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        LifecycleLogger.log("Scene: willResignActive")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        LifecycleLogger.log("Scene: willEnterForeground")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        LifecycleLogger.log("Scene: didEnterBackground")
    }
}
