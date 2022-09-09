//
//  NextView.swift
//  ActionSheet
//
//  Created by cmStudent on 2022/08/23.
//

import SwiftUI

struct NextView: View {
//    @Binding var isShowActionSheet: Bool
    @StateObject var viewModel: ActionSheetViewModel
   
    var body: some View {
        VStack {
            Button {
                viewModel.isShowActionSheet = true
                viewModel.changeMessage(modes: .central)
            } label: {
                Text("Central")
//                Image(systemName: "slider.horizontal.3")
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
                                viewModel.changeMode(mode: 1)
                                viewModel.isShowCentral = true
                            }
                        }),
                        .default(Text(viewModel.message2), action: {
                            var transaction = Transaction()
                            transaction.disablesAnimations = true
                            withTransaction(transaction) {
                                viewModel.changeMode(mode: 2)
                                viewModel.isShowCentral = true
                            }
                        }),
                        .cancel(Text("Cencel"))
                    ])
            }
            .fullScreenCover(isPresented: $viewModel.isShowCentral){
                if 1 == viewModel.identifier {
                    TherdView(viewModel: ActionSheetViewModel())
                } else if 2 == viewModel.identifier {
                    ActionSheetView()
                }
            }
        }
    }
}
