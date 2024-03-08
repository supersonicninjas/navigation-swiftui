//
//  ContentView.swift
//  NavigationApp
//
//  Created by Mirza Učanbarlić on 24. 2. 2024..
//

import SwiftUI

struct ContentView: View {
    @Environment(Router.self) var router
    @State private var isSheetPresented = false
    @State private var isFullScreenPresented = false
    
    var body: some View {
        @Bindable var bindableRouter = router
        NavigationStack(path: $bindableRouter.path) {
            Form {
                Button("Present Sheet") {
                    isSheetPresented.toggle()
                }
                Button("Present Full Screen") {
                    isFullScreenPresented.toggle()
                }
                ForEach(Screen.allCases) { screen in
                    Button(screen.title) {
                        router.add(screen: screen)
                    }
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .one:
                    ScreenOneView()
                case .two:
                    ScreenTwoView()
                case .three:
                    ScreenThreeView()
                }
            }
        }
        .sheet(isPresented: $isSheetPresented, content: {
            PresentedView()
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(24)
        })
        .fullScreenCover(isPresented: $isFullScreenPresented) {
            PresentedView()
        }
    }
}

struct PresentedView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: "xmark")
                    .onTapGesture {
                        dismiss()
                    }
            }
            Spacer()
            Text("I am a presented view!")
            Spacer()
        }
        .padding(.all, 24)
    }
}

struct ScreenOneView: View {
    var body: some View {
        Text("Screen One")
            .foregroundStyle(Color.red)
    }
}

struct ScreenTwoView: View {
    var body: some View {
        Text("Screen Two")
            .foregroundStyle(Color.blue)
    }
}

struct ScreenThreeView: View {
    var body: some View {
        Text("Screen Three")
            .foregroundStyle(Color.green)
    }
}


#Preview {
    let router = Router()
    return ContentView()
        .environment(router)
        
}
