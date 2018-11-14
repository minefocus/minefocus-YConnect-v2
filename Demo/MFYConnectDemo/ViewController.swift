//
//  ViewController.swift
//  MFYConnectDemo
//
//  Created by madao23 on 2018/11/14.
//  Copyright © 2018 SCSK Corporation. All rights reserved.
//

import UIKit
import MFYConnect

class ViewController: UIViewController {
    @IBOutlet var tokenLb: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        AuthSDKHelper.share.yahooAuthHandler = { token in
            self.tokenLb.text = token
        }
    }
    
    @IBAction func yahooOpen() {
        AuthSDKHelper.share.yahooOpenURL(self)
    }
    
}


class AuthSDKHelper {
    
    // yahooAuth
    var yahooAuthHandler:((_ accessToken: String?) -> Void)?
    
    private static let s_share = AuthSDKHelper()
    class var share: AuthSDKHelper {
        return s_share
    }
    
    //ユーザー切替処理
    func yahooOpenURL(_ vc: UIViewController? = nil) {
        guard  let util = YConnectStringUtil.init() else {return}
        let state = util.generateState()
        let nonce = util.generateNonce()
        if let yconnect = YConnectManager.sharedInstance() {
            yconnect.requestAuthorization(withState: state, prompt: nil, nonce: nonce, presenting: vc)
        }
    }
    
    func yahooAuth(url: URL) {
        if let yconnect = YConnectManager.sharedInstance() {
            yconnect.parseAuthorizationResponse(url) { (error) in
                if error != nil {
                    self.yahooAuthHandler?(nil)
                } else {
                    let accessTokenString = yconnect.accessTokenString()
                    self.yahooAuthHandler?(accessTokenString)
                }
            }
        }
    }
    
}

