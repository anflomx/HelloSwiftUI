//
//  LightBulbView.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 29/01/24.
//

import SwiftUI

struct LightBulbView: View {
    //@Binding var isOn: Bool
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            Image(systemName: appState.isOn ? "lightbulb.fill": "lightbulb")
                .font(.largeTitle)
                .foregroundStyle(appState.isOn ? .yellow : .black)
            Button("Toggle") {
                appState.isOn.toggle()
            }
        }
    }
}

//struct LightBulbView_Previews: PreviewProvider {
//    static var previews: some View {
//        LightBulbView(isOn: )
//    }
//}
