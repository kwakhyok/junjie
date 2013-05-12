package cn.com.agilemaster

class Role implements Serializable{

    String name
    static hasMany = [ users: User, permissions: String ]
    static belongsTo = User

    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }
}
