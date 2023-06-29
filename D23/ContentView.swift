//
//  ContentView.swift
//  D23
//  CUSTOM MODIFIERS
//  Created by yannemal on 28/06/2023.
//

import SwiftUI


// building our own ViewModifier for Rebels and Jedi
// after applying SwiftUI modifiers to both parent and child Views (see Sith and Empire)

struct HeroesGraphic: ViewModifier {
    // step 1 : build out modifier > protocol certificate requires proof of conduct
    // having these 2 steps at the bottom of the swift file within the ContentView { } breaks the code
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.green)
            .padding(20)
            .background(.indigo)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        
    }
}

// MARK: - EXTENSIONS

//step 2 : custom modifiers are easier to work with when they have an extension > provides .dot weasy access
extension View {
    func goodGuyStyle() -> some View {
        modifier(HeroesGraphic())
    }
}
//step 3 : put to use within ContentView below


struct ContentView: View {

    // MARK: - DATA View
    @State private var useRedText = false
    // views as types
    struct CapsuleText: View {
        var text: String
        
        var body: some View {
            Text(text)
                .padding(5)
            .foregroundColor(.red)
            .bold()
            .background(.black)
            .clipShape(Capsule())
        }
    }
    
    var body: some View {
        
        // MARK: - VIEW
        VStack(spacing: 15) {
            Text(" ")
            Text("Jedi")
                .goodGuyStyle()
            CapsuleText(text: "Sith")           // child Views overrule where possible
            Text("Empire")
            // override Parent Vstack modifier:
                .foregroundColor(.white)
                .background(.black)
                .clipShape(Capsule())
            Text("Rebels")
                .goodGuyStyle()
            Text(" ")
        }
        // end Vstack
        // apply modifier to parent > environment modifier
        .font(.largeTitle)
        .foregroundColor(.blue)
        
    }
    
// MARK: - METHODS
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
