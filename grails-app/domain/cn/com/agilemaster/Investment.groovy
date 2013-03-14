package cn.com.agilemaster

/**
 * Investment : an investment task represents
 *
 */
class Investment extends Task{

    /* Default (injected) attributes of GORM */
//	Long	id
//	Long	version
    String projectName
    Integer projectSum /* unit as 10k RMB*/

    Integer percentage

    boolean isPaid

    Organization organization /* party B */

    String contact

    /* Automatic timestamping of GORM */
//	Date	dateCreated
//	Date	lastUpdated

//	static belongsTo	= []	// tells GORM to cascade commands: e.g., delete this object if the "parent" is deleted.
//	static hasOne		= []	// tells GORM to associate another domain object as an owner in a 1-1 mapping
//	static hasMany		= []	// tells GORM to associate other domain objects for a 1-n or n-m mapping
//	static mappedBy		= []	// specifies which property should be used in a mapping 

    static mapping = {
    }

    static constraints = {
        title nullable: true
        projectName nullable: true
        description nullable: true
        percentage(max: 100)
        contact nullable: true
        organization nullable: true
        percentage min: 0, max: 100
        description nullable: true
    }

    /*
      * Methods of the Domain Class
      */
//	@Override	// Override toString for a nicer / more descriptive UI 
	public String toString() {
		return "${organization?.name} invests ${projectName}";
	}
}
