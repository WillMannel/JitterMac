import SwiftUI

struct ContentView: View {
    @ObservedObject var jitterManager = MouseJitterManager()
    @State private var isJittering = false

    var body: some View {
        VStack {
            Text(isJittering ? "Jittering is ON" : "Jittering is OFF")
            Button(action: {
                self.jitterManager.toggleJitter()
                self.isJittering.toggle()
            }) {
                Text("Toggle Jitter")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
