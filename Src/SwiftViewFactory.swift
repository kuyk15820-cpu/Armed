import SwiftUI
import UIKit

@objc(SwiftViewFactory) // บังคับชื่อคลาสใน Objective-C Runtime
class SwiftViewFactory: NSObject {
    
    // บังคับชื่อ Selector ให้ตรงกับที่ RootViewController.mm เรียกใช้เป๊ะๆ
    @objc(createMainViewWithOnSelectVideo:)
    static func createMainView(onSelectVideo: @escaping () -> Void) -> UIViewController {
        let mainView = MainView(onSelectVideo: onSelectVideo)
        let hostingController = UIHostingController(rootView: mainView)
        hostingController.view.backgroundColor = UIColor.black
        return hostingController
    }
}
