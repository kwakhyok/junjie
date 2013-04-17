package cn.com.agilemaster

/**
 * Workbreakdown
 * A domain class describes the data object and it's mapping to the database
 */
class Workbreakdown {




	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    String code
    String title // e.g. 2009-xxxx-WBS
    String status = 'archived' // 'archived', 'on-progress'

	/* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [tasks:Task,works:Work]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
    }
    
	static constraints = {
        code(size: 1..20, unique:true, nullable: false)
        title(size: 1..20, nullable: false)
        status(shared: 'WBSStatus')
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${code} ${title}";
	}

}
