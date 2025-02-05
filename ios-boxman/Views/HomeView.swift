import SwiftUI

struct HomeView: View {
    @State private var rotationAngle = 0.0
    @State private var animateGradient = false
    
    var body: some View {
        NavigationStack {
                
            VStack {
                VStack {
                    Text("Boxman!")
                        .font(.system(size: 74))
                        .bold()
                    
                    Text("An AR Experience")
                        .font(.system(size: 35))
                        .italic()
                }
                .foregroundStyle(.white)
                .padding(.bottom, 45)
                
                
                NavigationLink(destination: ARExperienceView()) {
                    Text("Start")
                        .font(.system(size:21))
                        .padding()
                        .padding(.horizontal, 12)
                        .bold()
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding(.bottom, 82)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.15, green: 0.15, blue: 0.25),
                        .black
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    HomeView()
}
