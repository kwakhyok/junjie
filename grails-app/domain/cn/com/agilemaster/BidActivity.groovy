package cn.com.agilemaster

/**
 * BidActivity
 * A domain class describes the action done by organization to a bidsecion and it's mapping to the database
 */
class BidActivity {

    /* Default (injected) attributes of GORM */
	Long	id
//	Long	version

    String tags = '意向'

    /* Automatic timestamping of GORM */
	Date	dateCreated
	Date	lastUpdated

	static belongsTo	= [organization:Organization, bidSection:BidSection]	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        tags size: 1..50, inList: ['意向','投标']
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${id}: ${organization.name} ${tags} ${bidSection.title}";
	}

}
