//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import SwiftUI

extension View {
    
    func disableAutoCapsAndCorrection() -> some View {
        self
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
    }
    
}
