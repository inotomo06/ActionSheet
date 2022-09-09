//
//  ActionSheetViewModel.swift
//  ActionSheet
//
//  Created by cmStudent on 2022/08/23.
//

import Foundation

final class ActionSheetViewModel: ObservableObject {
    
    enum Modes {
        case onAppear
        case central
        case peripheral
    }
    
    // 的の画面に遷移
    @Published var isShowCentral = false
    // 銃の画面に遷移
    @Published var isShowPeripheral = false
    // mode変更のActionSheet
    @Published var isShowActionSheet = false
    // タイトルに戻る
    @Published var isShowTitle = false
    // ActionSheetの選択１
    @Published var message = ""
    // ActionSheetの選択２
    @Published var message2 = ""
    // Modesの情報を入れてお器
    @Published var modes: Modes = .central
    // アクションシートのメッサージのどちらが選択されたかを保存識別するやつ
    @Published var identifier = 0
    
    func changeMessage(modes: Modes) {
//        self.modes = modes
        switch modes {
        case .onAppear:
            isShowActionSheet = true
            message = "このデバイスを的にする"
            message2 = "このデバイスを銃にする"
            
        case .central:
            message = "このデバイスを銃にする"
            message2 = "終わる"
            
        case .peripheral:
            message = "このデバイスを的にする"
            message2 = "終わる"
        }
    }
    
    func changeMode(mode: Int) {
        
        if 1 == mode {
            identifier = mode
        } else {
            identifier = mode
        }
    }
}
