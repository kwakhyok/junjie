package cn.com.agilemaster

/**
 * NewsVisit
 * A domain class describes the data object and it's mapping to the database
 */
class NewsVisit {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version


    /* Automatic timestamping of GORM */
	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [news:News, visitor:User]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        visitor(nullable: true) // allow anonymous visits
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${visitor} read ${news.title} on ${news.dateCreated.format('yyyy-MM-dd')}";
	}
}
