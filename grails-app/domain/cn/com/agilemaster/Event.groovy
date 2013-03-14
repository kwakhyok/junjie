package cn.com.agilemaster

/**
 * Event
 * A domain class describes the data object and it's mapping to the database
 */
class Event {

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String title
    String description
    boolean  isMilestone
    Date startDate

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

	static belongsTo	= [project: Project]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        title blank: false, size: 1..20
        description blank: false, size: 1..440
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${title}";
	}
}
