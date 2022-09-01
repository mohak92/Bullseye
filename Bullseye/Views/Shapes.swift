//
//  Shapes.swift
//  Bullseye
//
//  Created by Mohak Tamhane on 8/30/22.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                //.fill(Color.blue)
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 200, height: 100)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
