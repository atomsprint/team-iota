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
    @IBOutlet weak var Item2ImageView: UIImageView?
    @IBOutlet weak var Item3ImageView: UIImageView?
    @IBOutlet weak var Item4ImageView: UIImageView?
    @IBOutlet weak var Item5ImageView: UIImageView?
    @IBOutlet weak var Item6ImageView: UIImageView?
    @IBOutlet weak var Item7ImageView: UIImageView?
    //@IBOutlet weak var Item8ImageView: UIImageView?
    @IBOutlet weak var Item9ImageView: UIImageView?
    
    /// 表示に必要なポイントをキー、UIImageViewを値とする辞書
    private var itemViewsByPoints: [Int: UIImageView] = [:]
    
    /// ポイント管理クラス
    private let pointsManager = PointsManager.shared
    
    /// ビューが読み込まれたときの初期化処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Iotaの画像を一番下に配置（アイテムが上に表示されるように）
        self.view.sendSubviewToBack(iotaImageView)
        
        // アイテム画像ビューをポイントをキーとした辞書にまとめる
        itemViewsByPoints = [
            0: Item1ImageView,   // Item1 は常に表示（0ポイント）
            100: Item2ImageView,  // Item2 は10ポイント以上
            200: Item3ImageView,  // Item3 は20ポイント以上
            400: Item4ImageView,  // Item4 は30ポイント以上
            800: Item5ImageView,  // Item5 は40ポイント以上
            1400: Item6ImageView,  // Item6 は50ポイント以上
            2000: Item7ImageView,  // Item7 は60ポイント以上
            3000: Item9ImageView   // Item9 は70ポイント以上
        ].compactMapValues { $0 }
        
        // 全てのアイテムにドラッグ機能を設定
        setupDragGestures()
        
        // 現在のポイントに基づいてアイテムの表示/非表示を決める
        updateItemVisibility()
        
        // ポイントが変更されたときの通知を受け取る設定
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onPointsUpdated),
            name: .pointsUpdated,
            object: nil
        )
    }
    
    /// ビューが表示される直前
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 表示状態を更新
        updateItemVisibility()
    }
    
    /// ビューコントローラーが破棄される直前
    deinit {
        // 通知の監視を解除
        NotificationCenter.default.removeObserver(self)
    }
    
    /// 全てのアイテムにドラッグジェスチャーを設定
    private func setupDragGestures() {
        for itemView in itemViewsByPoints.values {
            configureDragGesture(for: itemView)
        }
    }
    
    /// 個別のアイテムにドラッグジェスチャーを設定
    private func configureDragGesture(for itemView: UIImageView) {
        // ドラッグ（パン）ジェスチャーを作成
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        // ジェスチャーをビューに追加
        itemView.addGestureRecognizer(panGesture)
        // ユーザー操作を有効にする
        itemView.isUserInteractionEnabled = true
    }
    
    /// ポイントが更新されたときの処理
    @objc private func onPointsUpdated() {
        // 表示状態を更新
        updateItemVisibility()
    }
    
    /// ポイントに基づいてアイテムの表示/非表示を更新
    private func updateItemVisibility() {
        // 現在のポイントを取得
        let currentPoints = pointsManager.points
        
        // 各アイテムについて、必要なポイントと現在のポイントを比較して表示/非表示を決める
        for (requiredPoints, itemView) in itemViewsByPoints {
            if currentPoints >= requiredPoints {
                // ポイントが足りているので表示
                itemView.isHidden = false
            } else {
                // ポイントが足りていないのでかくす
                itemView.isHidden = true
            }
        }
    }
    
    /// ドラッグ（パン）ジェスチャーの処理
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        // ドラッグの移動量を取得
        let translation = gesture.translation(in: view)
        
        // ジェスチャーが発生したビューを取得
        if let draggedView = gesture.view {
            // ビューを移動
            draggedView.center = CGPoint(
                x: draggedView.center.x + translation.x,
                y: draggedView.center.y + translation.y
            )
        }
        
        // 移動量をリセット（次の移動に備える）
        gesture.setTranslation(.zero, in: view)
    }
}
