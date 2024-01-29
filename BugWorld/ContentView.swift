//
//  ContentView.swift
//  BugWorld
//
//  Created by Patrick Culmer on 03/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State var imageFile = "BlueRoom"
    @State var textLog = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    @State var textInput = String()
    var body: some View {
        VStack {
            Image(imageFile).resizable().aspectRatio(contentMode: .fit)
            Text(imageFile)
            ScrollView {
                        ScrollViewReader { proxy in
                            Text(textLog)
                                .id(atBottom) // Assign an ID to the text view
                            // This modifier will be triggered whenever 'textLog' changes
                            .onChange(of: textLog) {
                                withAnimation {
                                    // Scroll to the bottom
                                    proxy.scrollTo(atBottom, anchor: .bottom)
                                }
                            }
                        }
                    }
            TextField(">", text: $textInput )
                .onSubmit {
                    imageFile = textInput
                    textLog += "\n" + textInput
                    textInput = ""
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
