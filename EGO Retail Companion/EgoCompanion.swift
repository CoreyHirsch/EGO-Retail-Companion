import SwiftUI
import CodeScanner

class GameState: ObservableObject {
    
    struct Tool: Hashable {
        let id: Int
        let model: String
        let serialNumber: String
    }
 

  
    
    @Published var toolList:Array<Tool> = [];
    
    @Published var viewState:Int;
    @Published var customerName:String?;
    @Published var customerEmail:String?;
    @Published var customerPhone:String?;
    @Published var customerAddress:String?;
    @Published var customerZipcode:String?;
    @Published var customerState:String?;
    @Published var customerCity:String?;
    
    @Published var isPresentingScanner = false
    @Published var scannedCode: String = "Scan a QR code to get started."
   
    
    
    @Published var tool:Array? = [];
    @Published var model:String?;
    @Published var serial:String?;

    
    init(viewState:Int) {
        self.viewState = viewState;
        //self.toolList = [];
        self.tool = [];
        self.model = "";
        self.serial = "";
    }
}


@main
struct CustomerInformationApp: App {
    
    @ObservedObject var gameState:GameState = GameState(viewState: 0);
    
    
    
    var body: some Scene {
        WindowGroup {        
            
           
        
            
            if (gameState.viewState == 0) {
                CustomerInformationForm().environmentObject(gameState)
            } else {
                InformationView().environmentObject(gameState)
            }

        
                
        }
    }
}

