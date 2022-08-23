//
//  ActionSheetView.swift
//  ActionSheet
//
//  Created by cmStudent on 2022/08/23.
//

import SwiftUI

struct ActionSheetView: View {
    @ObservedObject var viewModel = ActionSheetViewModel()
    
    var body: some View {
        
        VStack {
            Button {
                viewModel.isShowActionSheet = true
            } label: {
                Text("open ActionSheet")
            }
        }
        .onAppear {
            viewModel.changeMessage(modes: .onAppear)
        }
        .actionSheet(isPresented: $viewModel.isShowActionSheet) {
            ActionSheet(
                title: Text("Changing settings"),
                buttons: [
                    .default(Text(viewModel.message), action: {
                        // アニメーションをなくすやつ
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            viewModel.changeMessage(modes: .playing(select: "target"))
                            viewModel.changeMode(mode: 1)
                            viewModel.isShowCentral = true
                            
                        }
                    }),
                    .default(Text(viewModel.message2), action: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            viewModel.changeMessage(modes: .playing(select: "gun"))
                            viewModel.changeMode(mode: 2)
                            viewModel.isShowCentral = true
                        }
                    }),
                    .cancel(Text("Cencel"))
                ])
        }
        .fullScreenCover(isPresented: $viewModel.isShowCentral){
            
            if 1 == viewModel.identifier {
                NextView(viewModel: ActionSheetViewModel())
            } else {
                TherdView(viewModel: ActionSheetViewModel())
            }
        }
    }
}

