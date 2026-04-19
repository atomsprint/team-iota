//
//  SecondViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2025/11/09.
//

import UIKit

class IotaRoomViewController: UIViewController {

    @IBOutlet weak var iotaImageView: UIImageView!
    @IBOutlet weak var Item1ImageView: UIImageView!
    
    private var panGesture: UIPanGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // ドラッグジェスチャーの初期化
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        
        // ドラッグジェスチャーを追加
        Item1ImageView.addGestureRecognizer(panGesture!)
        Item1ImageView.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
        
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        if let view = gesture.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        gesture.setTranslation(.zero, in: view)
    }
        
}
