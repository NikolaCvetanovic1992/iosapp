import SwiftUI
import Flutter

struct ContentView: View {
  // Flutter dependencies are passed in an EnvironmentObject.
  @EnvironmentObject var flutterDependencies: FlutterDependencies

  // Button is created to call the showFlutter function when pressed.

  @State private var isFlutterPresented = false

  var body: some View {

            Button("Load Flutter Checkin!") {
                showFlutter()
            }
       
  }

func showFlutter() {
    // Get the RootViewController.
    guard
      let windowScene = UIApplication.shared.connectedScenes
        .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
      let window = windowScene.windows.first(where: \.isKeyWindow),
      let rootViewController = window.rootViewController
    else { return }

    // Create the FlutterViewController.
    let flutterViewController = FlutterViewController(
      engine: flutterDependencies.flutterEngine,
      nibName: nil,
      bundle: nil)
    flutterViewController.modalPresentationStyle = .popover
    flutterViewController.isViewOpaque = false

    rootViewController.present(flutterViewController, animated: true)
    
    isFlutterPresented = true
  }
  
  func hideFlutter() {
        // Dismiss the FlutterViewController if it is presented.
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController,
              let flutterViewController = rootViewController.presentedViewController as? FlutterViewController else {
            return
        }

        flutterViewController.dismiss(animated: true) {
            // Update state to indicate Flutter is not presented anymore
        }
        isFlutterPresented = false
    }
}

