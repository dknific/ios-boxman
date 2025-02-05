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
                    
                    Text("\"Watch him go...\"")
                        .font(.system(size: 39))
                        .italic()
                }
                .padding(.top, 81)
                
                Spacer()
                
                NavigationLink(destination: ARExperienceView()) {
                    Text("Make Him Dance")
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
                        .gray,
                        .white
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
