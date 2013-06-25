package cn.com.agilemaster

class DesignCategory {

    String name

    static hasMany = [designs:Design]

    static belongsTo = [parentCategory: DesignCategory]

    static constraints = {
        name size: 1..20, unique: true, nullable: false
        parentCategory nullable: true
    }

    public String toString(){

        "${name}"
    }
}
