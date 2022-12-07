import SwiftUI
import CodeScanner
import MessageUI



struct CustomerInformationForm: View {
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.dataMatrix],
            completion: { result in
                if case let .success(code) = result {
                    serial = code.string;
                    gameState.scannedCode = code.string;
                    gameState.isPresentingScanner = false;
                }
            }
        )
    }
    
    
//    struct Tool: Hashable {
//        let id: Int
//        let model: String
//        let serialNumber: String
//    }
    
    @State var selectedTool: String = "";
//    @State var toolList:Array<Tool> = [];
    @State var toolList:Array<String> = [];
    
    
    @State private var showingEmailComposer = false;
    
    //@State private var emailAddress = "ben10elvis@gmail.com"
    @State private var bccEmail = "ben10elvis@gmail.com"
    
        
    //@State var tools:String;
    //@State var toolList:Array = [];
    //@State var tool:Array = [];
    @State var model:String;
    @State var serial:String;
    
    @State var isPresentingScanner = false
    
    
    @State var customerName:String;
    @State var customerEmail:String;
    @State var customerPhone:String;
    @State var customerAddress:String;
    @State var customerZipcode:String;
    @State var customerState:String;
    @State var customerCity:String;
    @State var selectState:CusState;
    @State var formComplete:Bool;
    @State var errors:[String];
    @EnvironmentObject var gameState:GameState;
    
    
    
    
    
    enum CusState: String, CaseIterable, Identifiable {
        case AK, AL, AR, AZ, CA, CO, CT, DE, FL, GA, HI, IA, ID, IL, IN, KS, KY, LA, MA, MD, ME, MI, MN, MO, MS, MT, NC, ND, NE, NH, NJ, NM, NV, NY, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VA, VT, WA, WI, WV, WY
        
        var id: Self { self }
    }
   
    
    init() {
        toolList = [];
        //tool = [];
        model = "";
        serial = "";
    
        customerName = "";
        customerEmail = "";
        customerPhone = "";
        customerAddress = "";
        customerZipcode = "";
        customerState = "";
        customerCity = "";
        formComplete = false;
        errors = [];
        selectState = CusState.IL
    }
    var body: some View {
        
        
        
        Header();
        ScrollView {
        Group {
            ForEach(errors, id: \.self) { error in
                            Text(error)
                                .font(.title3)
                                .foregroundColor(.red)
                        }
            
            
            HStack {
                Text("* Full Name:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("John Doe", text: $customerName).frame(width: 200);
            }
            HStack {
                Text("* Email:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("example@gmail.com", text: $customerEmail).frame(width: 200);
            }
            HStack {
                Text("* Phone:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("(123)456-7890", text: $customerPhone).frame(width: 200);
            }
            HStack {
                Text("Address:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("1234 Somestreet Drive", text: $customerAddress).frame(width: 200);
            }
            HStack {
                Text("City:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("Some City", text: $customerCity).frame(width: 200);
                
                Text("State").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold().offset(x: -100);
                Picker(selection: $selectState, label: Text("State")){
                    ForEach(CusState.allCases) {casename in
                        Text(casename.rawValue)
                    }
                }.pickerStyle(.menu).colorMultiply(Color.init(red: 253/255, green: 171/255, blue: 244/255)).offset(x: -100);
            }
            HStack {
                Text("Zipcode:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("12345", text: $customerZipcode).frame(width: 200);
            }
            
            HStack {
                Text("Model: ").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("ST2400", text: $model).frame(width: 200);
            }
            HStack {
                
                Text("Serial:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
                TextField("NSB123456789X", text: $serial)
                    .frame(width: 200);
                
                
                
                Button(action: {
                    gameState.isPresentingScanner = true
                }) {
                   
                    Image(systemName: "camera.fill")
                }

                .sheet(isPresented: $gameState.isPresentingScanner){
                    self.scannerSheet
                }

                
                
            
                
                
                
            }
        }
//            if !toolList.isEmpty {
//                List(toolList) { tool in
//                    Text("ID: \(tool.id)")
//                    Text("Model: \(tool.model) Serial: \(tool.serialNumber)")
//                }
//            }
//
            
            if !toolList.isEmpty {

                Picker(selection: $selectedTool, label: Text("Tools")) {
                    ForEach(toolList, id: \.self) {tool in
                        Text(tool).tag(tool)
                    }
                }
                
//                Picker("Tools", selection: $selectedTool, content: {
//                                ForEach(toolList, id: \.self) { tool in
//                                    Text(toolList);
//
//                                }
//                            })
                        }
            
        HStack {
            Button("Add") {
                self.errors = []
                
                if self.model.isEmpty || self.serial.isEmpty {
                                    self.errors.append("The Model and Serial fields cannot be empty.")
                } else {
                    addTool(model: self.model, serial: self.serial)
                    self.model = "";
                    self.serial = "";
                }
                
            }.padding().font(.subheadline).foregroundColor(.white).background(Color.green).cornerRadius(40)
            
            
            Button("Remove"){
                if (toolList.count != 0){
                    
                
               
                }
            }.padding().font(.subheadline).foregroundColor(.white).background(Color.red).cornerRadius(40)
        }
        
            
        
        HStack {
            Button("Send Email") {
                errors = [];
                if self.customerName.isEmpty || self.customerEmail.isEmpty || self.customerPhone.isEmpty {
                                   self.errors.append("The Name, Email, and Phone fields cannot be empty.")
                               }
                
                if (errors.count == 0) {
//                    gameState.customerName = customerName;
//                    gameState.customerEmail = customerEmail;
//                    gameState.customerPhone = customerPhone;
//                    gameState.customerAddress = customerAddress;
//                    gameState.customerCity = customerCity;
//
//
//
//                    if (gameState.customerCity == "") {
//                        gameState.customerState = ""
//                    } else {
//                        gameState.customerState = selectState.rawValue;
//                    }
//                    gameState.customerZipcode = customerZipcode;
                    
                     self.showingEmailComposer.toggle()
                }
                
                
                
                
                
                
                
                
            }.padding().font(.subheadline).foregroundColor(.white).background(Color.red).cornerRadius(40)
            
            
         
        }
            
            
           
    
        Spacer();
            
        }
        
        if showingEmailComposer {
//                    EmailComposer(isShowing: $showingEmailComposer, bccEmail: $bccEmail, toolList: $toolList, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerZipcode, customerAddress: $customerState, customerZipcode: $customerAddress, customerState: $customerCity, customerCity: $customerPhone);
            
            EmailComposer(isShowing: $showingEmailComposer, bccEmail: $bccEmail, toolList: $toolList, customerName: $customerName, customerEmail: $customerEmail, customerPhone: $customerPhone, customerAddress: $customerAddress, customerZipcode: $customerZipcode, customerState: $customerState, customerCity: $customerCity)
        
        }
        
    }
      
//    func createTools() -> String {
//        return toolList.map {tool in
//            return "\(tool.model) (\(tool.serialNumber))"
//        }.joined(separator: "\n")
//    }
    
    func addTool(model: String, serial: String){
         let modelSerial = (model + " " + serial);
//        var tool:Tool;
//        let currentID:Int = toolList.count;
//        tool = Tool(id: (currentID + 1), model: model, serialNumber: serial);
        
        toolList.append(modelSerial);
        
    }

}

    struct EmailComposer: UIViewControllerRepresentable {
            
        @Binding var isShowing: Bool
       // @Binding var tools: [String]
        @Binding var bccEmail: String
        @Binding var toolList:Array<String>;
       
        
        
        
        
        
//        let tools = toolList.map {tool in
//            return "\(tool.model) (\(tool.serialNumber))"
//        }.joined(separator: "\n")
        
        @Binding var customerName: String;
        @Binding var customerEmail: String;
        @Binding var customerPhone: String;
        @Binding var customerAddress: String;
        @Binding var customerZipcode: String;
        @Binding var customerState: String;
        @Binding var customerCity: String;
        
        
        @State var emailMessage:String = "Thank you for your purchase of your new EGO tools. For your easy reference, your tools serial numbers and models are listed below as well as the information used for your warrenty registration.\n\n"

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIViewController(context: UIViewControllerRepresentableContext<EmailComposer>) -> MFMailComposeViewController {
            let emailComposer = MFMailComposeViewController()
            emailComposer.mailComposeDelegate = context.coordinator

            emailComposer.setToRecipients([customerEmail])
            emailComposer.setBccRecipients([bccEmail])
            emailComposer.setSubject("Thank you for your EGO Purchase")
            emailComposer.setMessageBody(emailMessage + "\n\n Name: \(customerName) \n Phone: \(customerPhone) \n Email: \(customerEmail) \n Address: \n \(customerAddress)\n \(customerCity), \(customerState) \(customerZipcode)\n\n Tools:" +  toolList.joined(separator: "\n") + "\n\nThank you for shopping with us!", isHTML: false)

            return emailComposer
        }

        func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<EmailComposer>) {

        }

        class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
            var parent: EmailComposer

            init(_ parent: EmailComposer) {
                self.parent = parent
            }

            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                parent.isShowing = false
            }
        }
    }

    

    

    
    
                                



