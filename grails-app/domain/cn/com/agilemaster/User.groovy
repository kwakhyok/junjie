package cn.com.agilemaster

class User {
    String username
    String passwordHash

    UserProfile profile
    
    static hasMany = [ roles: Role, permissions: String, activities:Activity]

    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }

    public String toString(){
        "${username}"
    }
}
