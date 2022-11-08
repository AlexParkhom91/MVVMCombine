import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController()
        let view = MyView()
        let viewModel = MyViewModel()
        view.viewModel = viewModel
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        navigationController.pushViewController(view, animated: true)
    }
}
