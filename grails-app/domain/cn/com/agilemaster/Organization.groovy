package cn.com.agilemaster

/**
 * Organization
 * A domain class describes the data object and it's mapping to the database
 */
class Organization {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String name
    String address
    String contact
    String scope
    String qualification
    String brand
    Integer capital
    String memo
    User user




    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [activities:Activity]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        name unique: true,blank: false
        address  nullable: true
        contact  nullable: true
        scope    nullable: true
        qualification nullable: true
        brand    nullable: true
        capital  nullable: true
        memo     nullable: true, size:1..300
        user nullable: true
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${name}";
	}
}
