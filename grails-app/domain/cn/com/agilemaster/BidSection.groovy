package cn.com.agilemaster

/**
 * BidSection
 * A domain class describes the data object and it's mapping to the database
 */
class BidSection extends Task{

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    // TODO: Re model this bid section
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
	static hasMany		= Task.hasMany	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping

    Integer estimateSum
    Integer subSectionSum
    Date bidDate
    String bidCategory

    static mapping = {
         table 'bidSection'
       // Task.mapping(delegate)
    }

    static constraints = {
        bidCategory(size: 1..20, nullable: true)
        bidDate(nullable: true)
        estimateSum min: 0, max: 10000, nullable: true
        subSectionSum min: 0, max: 10, nullable: true
        /* From Task constraints. Not DRY enough, I know */
        code(size: 1..10, nullable: false, unique: ['project','bidCategory'])
        title(size: 1..30, nullable: false)
        status(shared: 'taskStatus')
        description( nullable: true)
        currentPlan(nullable: true)
        preTask(nullable: true)
        parentTask(nullable: true)
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${bidCategory}: ${code}.${title}";
	}
}
