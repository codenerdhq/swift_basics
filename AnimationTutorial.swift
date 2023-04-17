// Tutorial built on the activities inside the Book:
// "SwiftUI Cookbook - Second Edition"
// The book uses SwiftUI 3, Swift 5.5
import SwiftUI

struct ContentView: View {
    @State var show = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .green, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            
            VStack {
                
                BannerView(message: "Animation!", show: show)
                Button {
                    show.toggle()
                } label: {
                    Text(show ? "Hide" : "Show")
                        .padding()
                        .frame(width: 150, height: 75)
                        .foregroundColor(.white)
                        .background(show ? .red : .blue)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct BannerView: View {
    let message: String
    var show: Bool
    
    var body: some View {
        Text(message)
            .font(.title)
            .frame(width:UIScreen.main.bounds.width - 50,
                   height: 100)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
            .offset(y: show ?
                    -UIScreen.main.bounds.height / 3 :
                        -UIScreen.main.bounds.height)
            .animation(
                .interpolatingSpring(mass: 2.0,
                                     stiffness: 100.0,
                                     damping: 8,
                                     initialVelocity: 0),
                value: show)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
