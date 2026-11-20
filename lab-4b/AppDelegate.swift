
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        LifecycleLogger.log("App: didFinishLaunching")
        return true
    }

    func applicationWillEnterForeground(
        _ application: UIApplication
    ) {
        LifecycleLogger.log("App: willEnterForeground")
    }

    func applicationDidEnterBackground(
        _ application: UIApplication
    ) {
        LifecycleLogger.log("App: didEnterBackground")
    }

    func applicationWillTerminate(
        _ application: UIApplication
    ) {
        LifecycleLogger.log("App: willTerminate")
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession:
        UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {

        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
}
