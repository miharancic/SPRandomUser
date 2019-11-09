//
//  MailComposer.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 08/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import Foundation
import MessageUI

final class MailComposer: NSObject {

    // MARK: Properties

    weak var presentingVC: UIViewController?

    // MARK: Init

    init(in presentingVC: UIViewController) {
        self.presentingVC = presentingVC
    }

    // MARK: API

    func sendEmail(to recepient: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([recepient])
            presentingVC?.present(mail, animated: true)
        }
    }

}

// MARK: - MFMailComposeViewControllerDelegate

extension MailComposer: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        presentingVC?.dismiss(animated: true, completion: nil)
    }
}
