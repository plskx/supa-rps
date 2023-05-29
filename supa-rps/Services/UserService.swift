//  Date: 5/28/23
//
//  Author: Zai Santillan
//  Github: @plskz


import Foundation

func createAccount(id: UUID, username: String) async throws {
    let user = User(id: id, username: username)
    print(user)
    
    let query = client
        .database
        .from("users")
        .insert(values: user)
    
    print("createAccount query = \(query)")
    
    do {
        try await query.execute()
        print("success")
    } catch {
        print("Error creating user account: \(error)")
        throw error
    }
}


func getCurrentUser(id: UUID) async -> User? {
    let query = client
        .database
        .from("users")
        .select()
        .eq(column: "id", value: id)
    
    let resp: [User] = try! await query.execute().value
    
    print("getCurrentUser = \(resp)")
    
    return resp.first
}
