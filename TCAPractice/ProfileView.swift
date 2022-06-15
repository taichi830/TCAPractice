//
//  ProfileView.swift
//  TCAPractice
//
//  Created by taichi on 2022/06/15.
//

import ComposableArchitecture
import SwiftUI

struct ProfileView: View {
    let store: Store<ProfileState, ProfileAction>
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text("Current Count: \(viewStore.count)")
                Button("Reset") {
                    viewStore.send(.resetCounterButtonTapped)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(store: Store(
            initialState: ProfileState(count: 0, currentTab: .profile),
            reducer: profileReducer,
            environment: ProfileEnvironment()))
    }
}
