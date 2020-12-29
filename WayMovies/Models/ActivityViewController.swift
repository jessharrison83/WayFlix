//
//  ActivityViewController.swift
//  WayMovies
//
//  Created by Jessica Berler on 12/29/20.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
           let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
           return controller
       }

       func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
