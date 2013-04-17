package cn.com.agilemaster

/**
 * Specialist
 * A domain class describes the data object and it's mapping to the database
 */
class Specialist {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String name
    String organization
    String telephone
    String memo

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [projects:Project]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        name size: 1..20, nullable: false
        organization size: 1..30, nullable: false
        telephone size: 1..20, nullable: true
        memo size: 1..1000, nullable: true
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${name}";
	}
}
