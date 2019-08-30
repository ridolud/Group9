//
//
//  Created by Faridho Luedfi on 30/08/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
