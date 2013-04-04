package cn.com.agilemaster

/**
 * Project
 * A domain class describes the data object and it's mapping to the database
 */
class Project {

	/* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String code
    String name
    String description
    Project parentProject = null
    User author


	/* Automatic timestamping of GORM */
	Date	dateCreated
//	Date	lastUpdated
	
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= [tasks:Task, subProjects:Project]	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 
	
    static mapping = {
    }
    
	static constraints = {
        code (size: 1..10, unique: true, nullable: true)
        name(size: 1..30, unique: true, blank: false)
        description(size: 1..5000, nullable: true)
        author(nullable: true)
        parentProject(nullable: true)
    }
	
	/*
	 * Methods of the Domain Class
	 */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${name}";
	}
}
