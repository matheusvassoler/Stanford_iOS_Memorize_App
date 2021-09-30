//
//  ContentView.swift
//  Memorize
//
//  Created by Matheus da Silva Vassoler on 22/09/21.
//

import SwiftUI

struct ContentView: View {
    let carEmojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀","⛵️", "🛸", "🛶", "🚌", "🏍", "🛵", "🚠", "🚛", "🚗", "🚝", "🚚", "🛳", "🚤"]
    let fruitEmojis = ["🍏", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍒", "🥭", "🍍","🍈", "🥥", "🥝", "🥑", "🍎"]
    let countryEmojis = ["🇧🇷", "🇧🇬", "🇨🇦", "🇨🇱", "🇰🇷", "🇨🇮", "🇺🇸", "🇪🇸", "🇫🇮", "🇫🇷", "🇬🇷","🇮🇹", "🇯🇵", "🇳🇱", "🇵🇦", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇾"]
    @State var emojis: [String] = []
    @State var emojiCount = 0
    
    var body: some View {
        VStack {
            Text("Memorize!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack(spacing: 50) {
                Button {
                    emojis = carEmojis
                    emojis.shuffle()
                    emojiCount = Int.random(in: 4...24)
                } label: {
                    VStack {
                        Image(systemName: "car")
                        Text("Vehicles").font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                    }
                }
                Button {
                    emojis = fruitEmojis
                    emojis.shuffle()
                    emojiCount = Int.random(in: 4...16)
                } label: {
                    VStack {
                        Image(systemName: "leaf")
                        Text("Fruits").font(.body)
                    }
                }
                Button {
                    emojis = countryEmojis
                    emojis.shuffle()
                    emojiCount = Int.random(in: 4...17)
                } label: {
                    VStack {
                        Image(systemName: "flag")
                        Text("Countries").font(.body)
                    }
                }
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
