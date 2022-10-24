import SwiftUI


class GameState: ObservableObject {
    @Published var viewState:Int;
    @Published var customerName:String?;
    @Published var customerEmail:String?;
    @Published var customerPhone:String?;
    @Published var customerAddress:String?;
    @Published var customerZipcode:String?;
    @Published var customerState:String?;
    @Published var customerCity:String?;

    
    init(viewState:Int) {
        self.viewState = viewState;
    }
}
@main
struct CustomerInformationApp: App {
    @ObservedObject var gameState:GameState = GameState(viewState: 0);
    var body: some Scene {
        WindowGroup {
            if (gameState.viewState == 0) {
                CustomerInformationForm().environmentObject(gameState);
            } else {
                InformationView().environmentObject(gameState);
            }
            
        }
    }
}
