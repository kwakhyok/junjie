package cn.com.agilemaster

/**
 * DemoTree
 * A domain class describes the data object and it's mapping to the database
 */
class DemoTree {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String code
    String title
    String description
    DemoTree parent

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [children:DemoTree]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
	static mappedBy		= [children: 'parent']	// specifies which property should be used in a mapping

    static mapping = {
    }

    static constraints = {
        code size: 1..20, unique: true
        title size: 1..20, blank: false
        description size: 1..1000, nullable: true
    }

    DemoTree getRootNode(){
        if(parent) return parent.getRootNode()
        else return this
    }


    boolean isLeaf(){
        return children.isEmpty();
    }

    boolean isRoot(){
        return ! parent
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
//	public String toString() {
//		return "${name}";
//	}
}
