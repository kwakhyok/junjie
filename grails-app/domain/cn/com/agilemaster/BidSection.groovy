package cn.com.agilemaster

/**
 * BidSection
 * A domain class describes the data object and it's mapping to the database
 */
class BidSection extends Task{

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version

    Organization organization
//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    String code
    Integer estimateSum
    Integer subSectionSum
    Date bidDate


    static mapping = {

    }

    static constraints = {
        code(blank: false)
        title(blank: false)
        description(size: 1..500, nullable: true)
        bidDate(nullable: true)
        organization(nullable: true)
        estimateSum min: 0, max: 10000
        subSectionSum min: 0, max: 10
        description size: 1..500, nullable: true

    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${title} [${code}]";
	}
}
