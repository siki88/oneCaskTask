//
//  CollectionView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct CollectionView: View {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @StateObject private var viewModel: CollectionViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: CollectionViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        BackgroundComponentView {
            contentView()
        }
        .safeAreaInset(edge: .top) {
            ZStack {
                HStack {
                    Label(text: "Genesis Collection", fontSize: 12, color: Color.white, maxWidth: nil)
                        .background(Color("backgroundDarkColor"))
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image("cancelIconButton")
                    }
                }
                .padding()
            }
            //.padding(.top, safeAreaInsets.top)
            .background(Color.clear)
            
        }
    }
    
    private func contentView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image("mockBigItem")
                
                VStack {
                    Label(text: "Bottle 135/184", fontSize: 12, color: Color("grayColor"))
                    
                    Text("Talisker ") + Text("18 Year old")
                    Text("#2504")
                    
                    #warning("TUDU")
                    
                    /*
                     switch viewModel.collectionContentType {
                     case .detail: detailContentView()
                     case .tastingNote: Color.red
                     case .history: Color.orange
                     }
                     */
                    
                }
                .padding(16)
                
                .background(Color("contentDarkColor"))
                
                

                Spacer()
            }
        }
    }
    
    private func detailContentView() -> some View {
        Color.red
    }
}
