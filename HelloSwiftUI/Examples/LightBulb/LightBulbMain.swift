//
//  LightBulbMain.swift
//  HelloSwiftUI
//
//  Created by Antonio Flores on 29/01/24.
//

import SwiftUI

struct LightBulbMain: View {
    //@State private var isLightOn: Bool = false
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            LightRoomView()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(appState.isOn ? .black : .white)
    }
}

struct LightBulbMain_Previews: PreviewProvider {
    static var previews: some View {
        LightBulbMain()
    }
}
