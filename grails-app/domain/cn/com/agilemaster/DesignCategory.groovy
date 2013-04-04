package cn.com.agilemaster

class DesignCategory {

    String name
    DesignCategory parentCategory = null


    static hasMany = [designs:Design]

    static constraints = {
        name size: 1..20, unique: true, nullable: false
        parentCategory nullable: true
    }

    public String toString(){

        "${name}"
    }
}
