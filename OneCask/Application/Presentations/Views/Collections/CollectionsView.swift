//
//  CollectionsView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

struct CollectionsView: View {
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @StateObject private var viewModel: CollectionsViewModel
    
    private var testData  = Array(1...20)
    
    private let layout = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    // MARK: - Lifecycle
    
    init(viewModel: CollectionsViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        BackgroundComponentView(
            backgroundColor: Color("backgroundTabColor"),
            backgroundImage: nil,
            bottomPadding: 0
        ) {
            contentView()
        }
        .safeAreaInset(edge: .top) {
            ZStack {
                HStack {
                    Label(text: "My collection", fontSize: 32, bold: true)
                    Spacer()
                    Button {
                        print("TUDU notification TAPPED")
                    } label: {
                        Image("notificationActiveIcon")
                    }
                }
                .padding()
            }
            .padding(.top, safeAreaInsets.top)
            .background(Color("backgroundTabColor"))
        }
        .fullScreenCover(isPresented: $viewModel.presented) {
            CollectionView(viewModel: .init(model: viewModel.presentedModel))
        }
    }
    
    private func contentView() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: layout) {
                ForEach(testData, id: \.self) { result in
                    itemContentView {
                        viewModel.presentedModel = result
                        viewModel.presented = true
                        print("open result: ",result)
                    }
                }
            }
            .padding(.bottom, 16)
        }
    }
    
    private func itemContentView(_ closure: @escaping () -> Void) -> some View {
        ZStack {
            VStack(spacing: 16) {
                Image("mockItem")
                VStack(spacing: .zero) {
                    Label(text: "Springbank\n1992 #1234", fontSize: 22)
                    Label(text: "(112/158)", fontSize: 12)
                }
            }
            .padding(16)
        }
        .background(Color("contentDarkColor"))
        .contentShape(Rectangle())
        .onTapGesture {
            closure()
        }
    }
}
