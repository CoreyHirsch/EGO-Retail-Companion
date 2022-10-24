import SwiftUI

struct CustomerInformationForm: View {
    
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
    
    enum CusState:String, CaseIterable, Identifiable {
        case AK;        case AL;        case AR;        case AZ;
        case CA;        case CO;        case CT;        case DE;
        case FL;        case GA;        case HI;        case IA;
        case ID;        case IL;        case IN;        case KS;
        case KY;        case LA;        case MA;        case MD;
        case ME;        case MI;        case MN;        case MO;
        case MS;        case MT;        case NC;        case ND;
        case NE;        case NH;        case NJ;        case NM;
        case NV;        case NY;        case OH;        case OK;
        case OR;        case PA;        case RI;        case SC;
        case SD;        case TN;        case TX;        case UT;
        case VA;        case VT;        case WA;        case WI;
        case WV;        case WY;
        
        var id:Self {self}
    }
    
    enum toolList:String, CaseIterable, Identifiable {
        case LB7654;
        case LB6703;
        case LM1801;
        case ST1501;
        
        var id:Self {self}
    }
    
    init() {
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
        HStack {
            Text("* Full Name:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
            TextField("John Doe", text: $customerName);
        }
        HStack {
            Text("* Email:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
            TextField("example@gmail.com", text: $customerEmail);
        }
        HStack {
            Text("* Phone:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
            TextField("(123)456-7890", text: $customerPhone);
        }
        HStack {
            Text("Address:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
            TextField("1234 Somestreet Drive", text: $customerAddress);
        }
        HStack {
            Text("City:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
            TextField("Some City", text: $customerCity);
            
            Text("State").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold().offset(x: -100);
            Picker(selection: $selectState, label: Text("State")){
                ForEach(CusState.allCases) {casename in
                    Text(casename.rawValue)
                }
            }.pickerStyle(.menu).colorMultiply(Color.init(red: 253/255, green: 171/255, blue: 244/255)).offset(x: -100);
        }
        HStack {
            Text("Zipcode:").font(.title3).foregroundColor(Color.init(red: 122/255, green: 193/255, blue: 66/255)).bold();
            TextField("12345", text: $customerZipcode);
        }
        
        
        HStack {
            Picker(selection: $selectState, label: Text("Tools")){
                ForEach(toolList.allCases) {casename in
                    Text(casename.rawValue)
                }
            }.pickerStyle(.wheel).colorMultiply(Color.init(red: 253/255, green: 171/255, blue: 244/255));
        }
        
        HStack {
            Button("Submit") {
                errors = [];
                if (customerName == ""){
                    errors.append("Name");
                }
                if (customerEmail == ""){
                    errors.append("Email");
                }
                if (customerPhone == ""){
                    errors.append("Phone");
                }
                
                if (errors.count == 0) {
                    gameState.customerName = customerName;
                    gameState.customerEmail = customerEmail;
                    gameState.customerPhone = customerPhone;
                    gameState.customerAddress = customerAddress;
                    gameState.customerCity = customerCity;
                    if (gameState.customerCity == "") {
                        gameState.customerState = ""
                    } else {
                        gameState.customerState = selectState.rawValue;
                    }
                    gameState.customerZipcode = customerZipcode;
                    
                    gameState.viewState = 1;
                } else {
                    
                }
                
                
                
                
                
            }.padding().font(.title).foregroundColor(.white).background(Color.red).cornerRadius(40)
        }
        
        
        Spacer();
    }
}


