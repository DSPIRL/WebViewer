//
//  ContentView.swift
//  WebViewer
//
//  Created by Raphael Erfan on 2/7/24.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var showWebview = false
    @State private var inputURL = ""
    @State private var loadURL: URL?
    private var urlString: String = "https://apple.com/"
    

    var body: some View {
        VStack(spacing: 40) {
            
            HStack {
                Group{
                    TextField("Enter URL", text: $inputURL, onCommit: {
                        loadInputURL()
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: nil, alignment: .top)
                    .padding([.leading])
                    .ignoresSafeArea(edges: .top)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    
                    Button("Load URL") {
                        loadInputURL()
                    }
                    .frame(alignment: .top)
                    .padding([.trailing])
                    .frame(width: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/)
                }
            }
        }
                  if let loadURL = loadURL {
                    WebView(url: loadURL)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.3), radius: 20.0, x: 5, y: 5
                        )
                        .ignoresSafeArea(edges: .bottom)
                        .padding([.top])
                        .frame(maxHeight: .infinity, alignment: .bottom)          
            
            
//            Link(destination: URL(string: urlString)!, label: {
//                Text("Open in a new window")
//                    .foregroundColor(.blue)
//            })
//             
//            Button("Open in a sheet") {
//                showWebview.toggle()
//            }
//            .sheet(isPresented: $showWebview) {
//                WebView(url: URL(string: urlString)!)
//            }
            
            
        }
    }
    
    func loadInputURL() {
        if let url = URL(string: inputURL) {
            loadURL = url
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}


#Preview {
    ContentView()
}
