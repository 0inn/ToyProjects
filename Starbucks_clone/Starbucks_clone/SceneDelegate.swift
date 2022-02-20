//
//  SceneDelegate.swift
//  Starbucks_clone
//
//  Created by 김영인 on 2022/02/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var imageView: UIImageView?

    // 첫 content view 설정
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // active 상태로 돌아왔을 때 = 다시 앱 실행
        if let imageView = imageView {
            imageView.removeFromSuperview()
            
            // 앱 꺼졌다가 다시 켜졌을 때, alert창 띄우기 -> present 위에서 안뜸 - UIView내에서만 작동
            let alert = UIAlertController(title: "알림창", message: "이어서 사용하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // will resign active 상태 = 백그라운드 진입 전 = 홈버튼 두번 = 스와이프
        guard let window = window else {
            return
        }
        imageView = UIImageView(frame: window.frame)
        imageView?.image = UIImage(named: "launch")
        window.addSubview(imageView!)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
//        let vc = AdVC()
//        vc.modalPresentationStyle = .fullScreen
//        self.window?.rootViewController?.present(vc,animated: false, completion: nil)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

