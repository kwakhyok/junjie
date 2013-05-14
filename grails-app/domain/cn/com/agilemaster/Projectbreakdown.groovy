package cn.com.agilemaster

/**
 * Projectbreakdown
 * A domain class describes the data object and it's mapping to the database
 */
class Projectbreakdown {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
	
	/* Automatic timestamping of GORM */
	Date	dateCreated
//	Date	lastUpdated

    String code
    String title
    String status  = 'on-progress'
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [projects:Project]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
        projects cascade: 'all-delete-orphan'
        projects lazy: false
    }
    
	static constraints = {
        code(size: 1..20, nullable: false)
        title(size: 1..20, nullable: false)
        status(shared: 'WBSStatus')
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${code} ${title} ${status}";
	}
}
